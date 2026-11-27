---
search:
  boost: 2.0
---


# Enum: CriticalityLevel 




_Criticité métier en cas d'indisponibilité de l'application._



<div data-search-exclude markdown="1">

URI: [ea:CriticalityLevel](https://w3id.org/ea-lab/enterprise-architecture/CriticalityLevel)

## Permissible Values
| Value | Meaning | Description |
| --- | --- | --- |
| LOW | None | Impact faible, sans incidence sur le métier |
| MEDIUM | None | Impact modéré, contournement possible |
| HIGH | None | Impact fort sur au moins un processus métier majeur |
| CRITICAL | None | Indisponibilité inacceptable pour l'entreprise |




## Slots

| Name | Description |
| ---  | --- |
| [criticality](criticality.md) | Niveau de criticité métier de l'application |










## Identifier and Mapping Information





### Schema Source


* from schema: https://w3id.org/ea-lab/enterprise-architecture






## LinkML Source

<details>
```yaml
name: CriticalityLevel
description: Criticité métier en cas d'indisponibilité de l'application.
from_schema: https://w3id.org/ea-lab/enterprise-architecture
rank: 1000
permissible_values:
  LOW:
    text: LOW
    description: Impact faible, sans incidence sur le métier.
  MEDIUM:
    text: MEDIUM
    description: Impact modéré, contournement possible.
  HIGH:
    text: HIGH
    description: Impact fort sur au moins un processus métier majeur.
  CRITICAL:
    text: CRITICAL
    description: Indisponibilité inacceptable pour l'entreprise.

```
</details>

</div>