wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
dapr init -k