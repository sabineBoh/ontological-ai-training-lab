---
search:
  boost: 5.0
---

# Slot: team_name 


_Nom de l'équipe de support ou du prestataire._



<div data-search-exclude markdown="1">



URI: [ea:team_name](https://w3id.org/ea-lab/enterprise-architecture/team_name)
<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [SupportTeam](SupportTeam.md) | Équipe ou contrat assurant le support d'une application |  no  |






## Properties

### Type and Range

| Property | Value |
| --- | --- |
| Range | [String](String.md) |
| Domain Of | [SupportTeam](SupportTeam.md) |
### Cardinality and Requirements

| Property | Value |
| --- | --- |
| Required | Yes |


### Slot Characteristics

| Property | Value |
| --- | --- |
| Owner | [SupportTeam](SupportTeam.md) |












## Identifier and Mapping Information





### Schema Source


* from schema: https://w3id.org/ea-lab/enterprise-architecture




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | ea:team_name |
| native | ea:team_name |




## LinkML Source

<details>
```yaml
name: team_name
description: Nom de l'équipe de support ou du prestataire.
from_schema: https://w3id.org/ea-lab/enterprise-architecture
rank: 1000
owner: SupportTeam
domain_of:
- SupportTeam
range: string
required: true

```
</details></div>