# Dependencies Graph Chart
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](/LICENSE)
[![Test][github-actions-badge]][github-actions]

Helm chart for Dependencies Graph software.
It will deploy the following items:
- [neo4j](https://neo4j.com/) database
- [dependencies graph api](https://github.com/xclemence/dependencies-graph-services)
- [dependencies graph Viewer](https://github.com/xclemence/dependencies-graph-viewer)
- [dependencies graph graphql](https://github.com/xclemence/dependencies-graph-graphql)

## Installing the Chart

Clone repository on the local machine

```bash
git clone https://github.com/xclemence/dependencies-graph-chart && cd dependencies-graph-chart
```

Install the chart

```bash
helm install dependencies-graph .\dependencies-graph\ --set fullnameOverride=graph --namespace dependencies-graph --create-namespace
```

Test the chart installation

```bash
helm test DependenciesGraph --namespace dependencies-graph
```

## Configuration

### Global

All items generated are prefixed by "ReleaseName-ChartName". You can customize prefix value with the following parameters:

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `nameOverride` | Override chart name for item name generation. | `""` |
| `fullnameOverride` | Override prefix for item name generation. | `""` |


### Neo4j

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `neo4j.dockerImage` | Docker image name. | `"neo4j"` |
| `neo4j.dockerTag` | Docker image tag. | `"4.0.4"` |
| `neo4j.httpPort` | Exposed port for http. | `"7474"` |
| `neo4j.httpsPort` | Exposed port for https. | `"7473"` |
| `neo4j.boltPort` | Exposed port for bolt. | `"7687"` |
| `neo4j.persistentVolumeClaimName` | Override pvc used by Neo4j. A new pvc is created if the value is null. | `""` |

### Dependencies Graph Api

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `api.dockerImage` | Docker image name. | `"xclemence/dependencies-graph-api"` |
| `api.dockerTag` | Docker image tag. | `"1.1.0"` |
| `api.port` | Exposed port. | `"8000"` |
| `api.replicaCount` | Replica number. | `"1"` |


### Dependencies Graph Graphql

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `graphql.dockerImage` | Docker image name. | `"xclemence/dependencies-graph-graphql"` |
| `graphql.dockerTag` | Docker image tag. | `"1.0.2"` |
| `graphql.port` | Exposed port. | `"4001"` |
| `graphql.replicaCount` | Replica number. | `"1"` |

### Dependencies Graph Viewer

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `viewer.dockerImage` | Docker image name. | `"xclemence/dependencies-graph-viewer"` |
| `viewer.dockerTag` | Docker image tag. | `"1.2.0"` |
| `viewer.port` | Exposed port. | `"4200"` |
| `viewer.graphqlUri` | External addresse of Dependencies Graph Grapql service. | `"https://www.dependencies-graph.xyz/graph-graphql/graphql"` |
| `viewer.replicaCount` | Replica number. | `"1"` |


> Pod configurations are stored inside config map **{prefix}-config**

[github-actions]:                   https://github.com/xclemence/dependencies-graph-chart/actions
[github-actions-badge]:             https://github.com/xclemence/dependencies-graph-chart/workflows/Test/badge.svg?branch=master
