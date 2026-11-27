---
search:
  boost: 2.0
---


# Enum: DependencyType 




_Nature du lien entre deux applications._



<div data-search-exclude markdown="1">

URI: [ea:DependencyType](https://w3id.org/ea-lab/enterprise-architecture/DependencyType)

## Permissible Values
| Value | Meaning | Description |
| --- | --- | --- |
| DATA | None | Échange ou partage de données (flux batch, API de données, référentiel) |
| SERVICE | None | Appel de service synchrone (API, webservice) |
| MESSAGE_BUS | None | Échange de messages asynchrones via un middleware |
| INFRASTRUCTURE | None | Dépendance d'infrastructure (hébergement, OS, réseau, base de données) |
| SOFTWARE_LICENSE | None | Composant logiciel tiers sous licence commerciale obligatoire |




## Slots

| Name | Description |
| ---  | --- |
| [dependency_type](dependency_type.md) | Nature de la dépendance |










## Identifier and Mapping Information





### Schema Source


* from schema: https://w3id.org/ea-lab/enterprise-architecture






## LinkML Source

<details>
```yaml
name: DependencyType
description: Nature du lien entre deux applications.
from_schema: https://w3id.org/ea-lab/enterprise-architecture
rank: 1000
permissible_values:
  DATA:
    text: DATA
    description: Échange ou partage de données (flux batch, API de données, référentiel).
  SERVICE:
    text: SERVICE
    description: Appel de service synchrone (API, webservice).
  MESSAGE_BUS:
    text: MESSAGE_BUS
    description: Échange de messages asynchrones via un middleware.
  INFRASTRUCTURE:
    text: INFRASTRUCTURE
    description: Dépendance d'infrastructure (hébergement, OS, réseau, base de données).
  SOFTWARE_LICENSE:
    text: SOFTWARE_LICENSE
    description: Composant logiciel tiers sous licence commerciale obligatoire.

```
</details>

</div>