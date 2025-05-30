helm repo add dapr https://dapr.github.io/helm-charts/
helm repo update
# See which chart versions are available
helm search repo dapr --devel --versions

helm upgrade --install dapr dapr/dapr \
--version=1.7 \
--namespace dapr-system \
--create-namespace \
--wait