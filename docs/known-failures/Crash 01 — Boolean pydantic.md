# Crash n° 1 — Le booléen qui a fait tomber pydantic

**Contexte.** Exercice 02, premier essai d'extraction avec `gpt-4o-mini` sur le corpus Vertalis (français) et la première version du gabarit LinkML, qui déclarait le slot `is_critical_flow` en `range: boolean`.

**Commande.**

```powershell
docker compose run --rm -T -e OPENAI_API_KEY=$env:OPENAI_API_KEY `
  outils ontogpt extract `
  -t exercises/02-ontogpt/enterprise_architecture_ontogpt.yaml `
  -i exercises/01-linkml/vertalis_audit.txt `
  --auto-prefix UNKNOWN `
  -o /work/output/ea_extracted.yaml
```

**Symptômes observés avant le crash :** une série de warnings non fatals —

```
WARNING:root:Line '- PaymentBridge' does not contain a colon; ignoring
WARNING:root:Line '- CardShield' does not contain a colon; ignoring
WARNING:root:Line '- DataHub' does not contain a colon; ignoring
[... 10 lignes similaires pour les autres applications]
```

**Traceback (partie finale, la plus significative) :**

```
Traceback (most recent call last):
  File "/opt/venvs/onto/bin/ontogpt", line 10, in <module>
    sys.exit(main())
  [...]
  File "/opt/venvs/onto/lib/python3.11/site-packages/ontogpt/engines/spires_engine.py", line 925, in ground_annotation_object
    return py_cls(**new_ann)
  File "/opt/venvs/onto/lib/python3.11/site-packages/pydantic/main.py", line 280, in __init__
    validated_self = self.__pydantic_validator__.validate_python(data, self_instance=self)
pydantic_core._pydantic_core.ValidationError: 1 validation error for ApplicationDependency
is_critical_flow
  Input should be a valid boolean, unable to interpret input [type=bool_parsing, input_value='Non renseigné', input_type=str]
    For further information visit https://errors.pydantic.dev/2.14/v/bool_parsing
```

## Diagnostic

1. Le LLM a répondu, pour le slot booléen `is_critical_flow`, une chaîne de prose française : « Non renseigné ». Le texte source était en français, le modèle a suivi.
2. Le moteur SPIRES sait **ancrer** (grounding) les valeurs d'énumération et rectifier les hors-vocabulaire, mais il n'a **aucune réparation pour les booléens natifs** : la chaîne brute part directement dans la validation pydantic, qui est stricte.
3. pydantic refuse `'Non renseigné'` comme booléen → `ValidationError` → tout le processus s'arrête. L'appel API a été payé, l'extraction est perdue.

Question d'analyse : pourquoi `dependency_type` (énumération) n'a PAS fait crasher alors que le même modèle répondait en prose ? Réponse : parce que le moteur ancre les énumérations — les valeurs hors vocabulaire sont ignorées ou rectifiées silencieusement.

## Remède appliqué

Remplacer le type natif strict par une énumération à trois valeurs, offrant au modèle une porte de sortie honnête quand le texte ne dit rien :

```yaml
YesNoUnknown:
  description: Réponse oui / non, avec une valeur explicite si le texte ne dit rien.
  permissible_values:
    OUI: {description: Le texte l'affirme.}
    NON: {description: Le texte le nie.}
    INCONNU: {description: Le texte ne le précise pas.}
```

> **Leçon : dans un gabarit SPIRES, un vocabulaire fermé (énumération) protège l'extraction ; un type natif strict (boolean, date) l'expose. Prévoyez toujours une valeur « information absente ».**
