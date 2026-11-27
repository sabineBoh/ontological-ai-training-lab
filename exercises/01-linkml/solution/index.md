# Enterprise Architecture Schema

Modèle décrivant le paysage applicatif d'une entreprise : applications, dépendances entre applications, statut de cycle de vie, criticité métier, équipe de support et processus métier.

URI: https://w3id.org/ea-lab/enterprise-architecture

Name: enterprise-architecture



## Classes

| Class | Description |
| --- | --- |
| [Application](Application.md) | Application du système d'information |
| [ApplicationDependency](ApplicationDependency.md) | Dépendance technique ou fonctionnelle entre deux applications |
| [BusinessProcess](BusinessProcess.md) | Processus métier de l'entreprise appuyé par des applications |
| [Portfolio](Portfolio.md) | Vue d'ensemble du paysage applicatif d'une entreprise |
| [SupportTeam](SupportTeam.md) | Équipe ou contrat assurant le support d'une application |



## Slots

| Slot | Description |
| --- | --- |
| [applications](applications.md) | Liste des applications recensées |
| [as_of_date](as_of_date.md) | Date d'état des lieux du paysage applicatif |
| [business_owner](business_owner.md) | Direction ou entité métier responsable de l'application |
| [contact_email](contact_email.md) | Adresse e-mail de contact du support |
| [criticality](criticality.md) | Niveau de criticité métier de l'application |
| [dependencies](dependencies.md) | Applications dont dépend cette application |
| [dependency_type](dependency_type.md) | Nature de la dépendance |
| [depends_on](depends_on.md) | Nom canonique de l'application cible de la dépendance (celle dont l'applicati... |
| [description](description.md) | Description synthétique du processus |
| [is_critical_flow](is_critical_flow.md) | Vrai si l'interruption de ce flux bloque le métier |
| [name](name.md) | Nom du processus métier, par exemple « Gestion des campagnes marketing » |
| [processes](processes.md) | Processus métier appuyés par cette application |
| [provider](provider.md) | Mode de fourniture du support |
| [source_document](source_document.md) | Origine du recensement (nom du document audité, cabinet, etc |
| [status](status.md) | Statut de cycle de vie de l'application |
| [support](support.md) | Équipe ou prestataire en charge du support de l'application |
| [team_name](team_name.md) | Nom de l'équipe de support ou du prestataire |


## Enumerations

| Enumeration | Description |
| --- | --- |
| [ApplicationStatus](ApplicationStatus.md) | Position de l'application dans son cycle de vie |
| [CriticalityLevel](CriticalityLevel.md) | Criticité métier en cas d'indisponibilité de l'application |
| [DependencyType](DependencyType.md) | Nature du lien entre deux applications |
| [SupportProviderType](SupportProviderType.md) | Mode de fourniture du support |


## Types

| Type | Description |
| --- | --- |
| [Boolean](Boolean.md) | A binary (true or false) value |
| [Curie](Curie.md) | a compact URI |
| [Date](Date.md) | a date (year, month and day) in an idealized calendar |
| [DateOrDatetime](DateOrDatetime.md) | Either a date or a datetime |
| [Datetime](Datetime.md) | The combination of a date and time |
| [Decimal](Decimal.md) | A real number with arbitrary precision that conforms to the xsd:decimal speci... |
| [Double](Double.md) | A real number that conforms to the xsd:double specification |
| [Float](Float.md) | A real number that conforms to the xsd:float specification |
| [Integer](Integer.md) | An integer |
| [Jsonpath](Jsonpath.md) | A string encoding a JSON Path |
| [Jsonpointer](Jsonpointer.md) | A string encoding a JSON Pointer |
| [Ncname](Ncname.md) | Prefix part of CURIE |
| [Nodeidentifier](Nodeidentifier.md) | A URI, CURIE or BNODE that represents a node in a model |
| [Objectidentifier](Objectidentifier.md) | A URI or CURIE that represents an object in the model |
| [Sparqlpath](Sparqlpath.md) | A string encoding a SPARQL Property Path |
| [String](String.md) | A character string |
| [Time](Time.md) | A time object represents a (local) time of day, independent of any particular... |
| [Uri](Uri.md) | a complete URI |
| [Uriorcurie](Uriorcurie.md) | a URI or a CURIE |


## Subsets

| Subset | Description |
| --- | --- |
