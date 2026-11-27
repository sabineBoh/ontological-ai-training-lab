---
search:
  boost: 5.0
---

# Slot: depends_on 


_Nom canonique de l'application cible de la dépendance (celle dont l'application courante a besoin)._



<div data-search-exclude markdown="1">



URI: [ea:depends_on](https://w3id.org/ea-lab/enterprise-architecture/depends_on)
<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [ApplicationDependency](ApplicationDependency.md) | Dépendance technique ou fonctionnelle entre deux applications |  no  |






## Properties

### Type and Range

| Property | Value |
| --- | --- |
| Range | [Application](Application.md) |
| Domain Of | [ApplicationDependency](ApplicationDependency.md) |
### Cardinality and Requirements

| Property | Value |
| --- | --- |
| Required | Yes |


### Slot Characteristics

| Property | Value |
| --- | --- |
| Owner | [ApplicationDependency](ApplicationDependency.md) |












## Identifier and Mapping Information





### Schema Source


* from schema: https://w3id.org/ea-lab/enterprise-architecture




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | ea:depends_on |
| native | ea:depends_on |




## LinkML Source

<details>
```yaml
name: depends_on
description: Nom canonique de l'application cible de la dépendance (celle dont l'application
  courante a besoin).
from_schema: https://w3id.org/ea-lab/enterprise-architecture
rank: 1000
owner: ApplicationDependency
domain_of:
- ApplicationDependency
range: Application
required: true

```
</details></div>