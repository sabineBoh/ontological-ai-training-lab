---
search:
  boost: 5.0
---

# Slot: is_critical_flow 


_Vrai si l'interruption de ce flux bloque le métier._



<div data-search-exclude markdown="1">



URI: [ea:is_critical_flow](https://w3id.org/ea-lab/enterprise-architecture/is_critical_flow)
<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [ApplicationDependency](ApplicationDependency.md) | Dépendance technique ou fonctionnelle entre deux applications |  no  |






## Properties

### Type and Range

| Property | Value |
| --- | --- |
| Range | [Boolean](Boolean.md) |
| Domain Of | [ApplicationDependency](ApplicationDependency.md) |
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
| self | ea:is_critical_flow |
| native | ea:is_critical_flow |




## LinkML Source

<details>
```yaml
name: is_critical_flow
description: Vrai si l'interruption de ce flux bloque le métier.
from_schema: https://w3id.org/ea-lab/enterprise-architecture
rank: 1000
owner: ApplicationDependency
domain_of:
- ApplicationDependency
range: boolean

```
</details></div>