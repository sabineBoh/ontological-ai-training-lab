# Crash n° 3 — L'application fantôme « elle » (hallucination structurelle)

**Contexte.** Exercice 02, extraction réussie avec `openai/gpt-6-luna` — troisième run sur le même corpus et le même gabarit, après vidage du cache litellm (runs 1 et 2 documentés par ailleurs). Contrairement aux crashes 1 et 2, **aucun plantage ici** : l'extraction se termine, mais le résultat contient une application qui n'existe pas.

**Commande.**

```powershell
Remove-Item -Recurse -Force work/.litellm_cache -ErrorAction SilentlyContinue
docker compose run --rm -T -e OPENAI_API_KEY=$env:OPENAI_API_KEY `
  outils ontogpt extract `
  -t exercises/02-ontogpt/enterprise_architecture_ontogpt.yaml `
  -i exercises/01-linkml/vertalis_audit.txt `
  -m openai/gpt-6-luna `
  --auto-prefix UNKNOWN `
  -o /work/output/ea_extracted_run3.yaml
```

**Anomalie dans le résultat (`extracted_object.applications`) :**

```yaml
    - name: elle
      description: Soutient le processus « Gestion des campagnes » et contribue
        à l'encaissement des devis acceptés.
```

Et dans le `raw_completion_output`, l'origine du mal :

```
applications: NovaStay est en production depuis 2021 [...] ; elle soutient le
processus « Gestion des campagnes » et dépend de DataHub [...]
```

**Autres anomalies du même run (sans plantage) :**

- `is_critical_flow: OUI` sur-attribué à OrderPortal → FlowBus et OrderPortal → StockFlow, alors que le texte ne qualifie jamais ces flux de critiques (run précédent : `INCONNU`, honnête) ;
- processus de NovaStay devenu « Force de vente » au lieu de « Gestion des campagnes ».

## Diagnostic

1. Le premier appel LLM produit une liste d'applications **séparées par des points-virgules** ; SPIRES découpe sur ce séparateur et envoie chaque fragment dans un sous-appel dédié.
2. La phrase de NovaStay commence par un pronom : « ; **elle** soutient le processus... ». Le découpage a fait de « elle » un fragment autonome, et le sous-appel a pris le pronom pour un nom d'application.
3. Le texte source étant en français, les pronoms et formulations verbeuses multiplient ce type de pièges ; les gabarits SPIRES sont conçus et testés sur des corpus anglais.

## Détection mécanique : la preuve par les spans

Chaque entité réelle porte des `original_spans` — des couples `début:fin` de positions de caractères dans le corpus source. Cherchez « elle » dans `named_entities` : **aucune entrée, aucun span**. L'entité fantôme n'existe nulle part dans le texte — elle est donc détectable par un simple contrôle de cohérence automatisable, sans même relire le corpus.

## Remèdes

- **Réconciliation humaine** : exécuter plusieurs runs, confronter les résultats au texte source, arbitrer (voir l'exercice de comparaison du tutoriel).
- **Contrôle d'intégrité** : rejeter toute application sans span de traçabilité.
- **En amont** : corpus anglais pour limiter les pronoms piégeux, ou reformulation française évitant les pronoms sujets en début de fragment.

> **Leçon : l'extraction LLM est stochastique — un run peut être meilleur sur certains points (ce run-ci retrouve DataHub, FlowBus et la dépendance CardShield/SOFTWARE_LICENSE que le précédent avait ratés) et pire sur d'autres. Aucun run ne domine : la sortie d'une extraction doit être réconciliée, jamais consommée telle quelle.**
