---
search:
  boost: 2.0
---


# Enum: ApplicationStatus 




_Position de l'application dans son cycle de vie._



<div data-search-exclude markdown="1">

URI: [ea:ApplicationStatus](https://w3id.org/ea-lab/enterprise-architecture/ApplicationStatus)

## Permissible Values
| Value | Meaning | Description |
| --- | --- | --- |
| IN_PRODUCTION | None | En production, utilisée en conditions réelles |
| UNDER_DEVELOPMENT | None | En cours de développement, pas encore en production |
| PILOT | None | Déployée à titre expérimental sur un périmètre restreint |
| DEPRECATED | None | Toujours en production mais en fin de vie planifiée |
| RETIRED | None | Hors production, remplacée ou décommissionnée |




## Slots

| Name | Description |
| ---  | --- |
| [status](status.md) | Statut de cycle de vie de l'application |










## Identifier and Mapping Information





### Schema Source


* from schema: https://w3id.org/ea-lab/enterprise-architecture






## LinkML Source

<details>
```yaml
name: ApplicationStatus
description: Position de l'application dans son cycle de vie.
from_schema: https://w3id.org/ea-lab/enterprise-architecture
rank: 1000
permissible_values:
  IN_PRODUCTION:
    text: IN_PRODUCTION
    description: En production, utilisée en conditions réelles.
  UNDER_DEVELOPMENT:
    text: UNDER_DEVELOPMENT
    description: En cours de développement, pas encore en production.
  PILOT:
    text: PILOT
    description: Déployée à titre expérimental sur un périmètre restreint.
  DEPRECATED:
    text: DEPRECATED
    description: Toujours en production mais en fin de vie planifiée.
  RETIRED:
    text: RETIRED
    description: Hors production, remplacée ou décommissionnée.

```
</details>

</div>