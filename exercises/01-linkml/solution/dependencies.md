---
search:
  boost: 5.0
---

# Slot: dependencies 


_Applications dont dépend cette application._



<div data-search-exclude markdown="1">



URI: [ea:dependencies](https://w3id.org/ea-lab/enterprise-architecture/dependencies)
<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [Application](Application.md) | Application du système d'information |  no  |






## Properties

### Type and Range

| Property | Value |
| --- | --- |
| Range | [ApplicationDependency](ApplicationDependency.md) |
| Domain Of | [Application](Application.md) |
### Cardinality and Requirements

| Property | Value |
| --- | --- |
| Multivalued | Yes |


### Slot Characteristics

| Property | Value |
| --- | --- |
| Owner | [Application](Application.md) |












## Identifier and Mapping Information





### Schema Source


* from schema: https://w3id.org/ea-lab/enterprise-architecture




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | ea:dependencies |
| native | ea:dependencies |




## LinkML Source

<details>
```yaml
name: dependencies
description: Applications dont dépend cette application.
from_schema: https://w3id.org/ea-lab/enterprise-architecture
rank: 1000
owner: Application
domain_of:
- Application
range: ApplicationDependency
multivalued: true
inlined: true
inlined_as_list: true

```
</details></div>