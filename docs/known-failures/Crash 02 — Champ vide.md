# Crash n° 2 — Le champ `name:` laissé vide par un sous-appel

**Contexte.** Exercice 02, deuxième essai avec `gpt-4o-mini`, sur le gabarit corrigé (booléen remplacé par l'énumération `YesNoUnknown`). Corpus Vertalis inchangé.

**Commande.** Identique au crash n° 1 (cache litellm vidé avant lancement).

**Traceback (partie finale) :**

```
Traceback (most recent call last):
  File "/opt/venvs/onto/bin/ontogpt", line 10, in <module>
    sys.exit(main())
  [...]
  File "/opt/venvs/onto/lib/python3.11/site-packages/ontogpt/engines/spires_engine.py", line 751, in _parse_line_to_dict
    vals = [
  File "/opt/venvs/onto/lib/python3.11/site-packages/ontogpt/engines/spires_engine.py", line 752, in <listcomp>
    self._extract_from_text_to_dict(v, slot_range) for v in vals
  File "/opt/venvs/onto/lib/python3.11/site-packages/ontogpt/engines/spires_engine.py", line 229, in _extract_from_text_to_dict
    return self._parse_response_to_dict(raw_text, cls)
  File "/opt/venvs/onto/lib/python3.11/site-packages/ontogpt/engines/spires_engine.py", line 634, in _parse_response_to_dict
    r = self._parse_line_to_dict(continued_line, cls)
  File "/opt/venvs/onto/lib/python3.11/site-packages/ontogpt/engines/spires_engine.py", line 727, in _parse_line_to_dict
    raise ValueError(msg)
ValueError: Empty value in key-value line: name:
```

## Diagnostic

1. La pile traverse `_extract_from_text_to_dict → _parse_response_to_dict` : le crash a lieu dans un **sous-appel LLM récursif** (un appel par application), pas sur le texte principal.
2. Le modèle a produit, dans l'une de ses réponses intermédiaires, une ligne `name:` sans valeur après les deux-points. Le parseur ligne-à-ligne de SPIRES attend `clé: valeur` et refuse les valeurs vides.
3. Une variante du même problème existe : `IndexError: list index out of range` (ligne `final_val = vals[0]`), quand la valeur est composée uniquement de séparateurs — par exemple une liste de dépendances finissant par un point-virgule orphelin.

Comment enquêter vous-mêmes : relancez avec `ontogpt -vvv extract ...` pour journaliser chaque prompt et chaque réponse brute, puis cherchez le dernier bloc de réponse avant le crash.

## Remèdes (deux familles)

1. **Réduire la récursion** : gabarit aplati (voir `enterprise_architecture_flat.yaml`) — support et dépendances deviennent des chaînes à convention (`DataHub, DATA, OUI`), un seul niveau Portfolio → Application.
2. **Utiliser un modèle plus discipliné** : `openai/gpt-6-luna` respecte le format demandé et termine l'extraction sans crash sur ce corpus.

> **Leçon : un parseur fragile ligne-à-ligne + un modèle peu attentif au format = pipeline instable. Le coût de l'imbrication d'objets se paie en fiabilité ; aplatissez les gabarits extraits par LLM, même si c'est moins élégant en modélisation pure.**
