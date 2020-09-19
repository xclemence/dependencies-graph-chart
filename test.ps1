helm install dependencies-graph .\dependencies-graph\ --set fullnameOverride=graph --namespace dependencies-graph --create-namespace --dry-run --debug > Test.yaml

helm install dependencies-graph .\dependencies-graph\ --set fullnameOverride=graph --namespace dependencies-graph --create-namespace

helm uninstall dependencies-graph --namespace dependencies-graph
helm test dependencies-graph --namespace dependencies-graph

