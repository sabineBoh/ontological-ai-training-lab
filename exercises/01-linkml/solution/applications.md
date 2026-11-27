---
search:
  boost: 5.0
---

# Slot: applications 


_Liste des applications recensées._



<div data-search-exclude markdown="1">



URI: [ea:applications](https://w3id.org/ea-lab/enterprise-architecture/applications)
<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [Portfolio](Portfolio.md) | Vue d'ensemble du paysage applicatif d'une entreprise |  no  |






## Properties

### Type and Range

| Property | Value |
| --- | --- |
| Range | [Application](Application.md) |
| Domain Of | [Portfolio](Portfolio.md) |
### Cardinality and Requirements

| Property | Value |
| --- | --- |
| Multivalued | Yes |


### Slot Characteristics

| Property | Value |
| --- | --- |
| Owner | [Portfolio](Portfolio.md) |












## Identifier and Mapping Information





### Schema Source


* from schema: https://w3id.org/ea-lab/enterprise-architecture




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | ea:applications |
| native | ea:applications |




## LinkML Source

<details>
```yaml
name: applications
description: Liste des applications recensées.
from_schema: https://w3id.org/ea-lab/enterprise-architecture
rank: 1000
owner: Portfolio
domain_of:
- Portfolio
range: Application
multivalued: true
inlined: true
inlined_as_list: true

```
</details></div>