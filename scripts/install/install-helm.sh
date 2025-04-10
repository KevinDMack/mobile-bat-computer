arch="$(uname -m)"
case "$arch" in
    x86_64)
    architecture=amd64
    ;;
    aarch64)
    architecture=arm64
    ;;
    *)
    echo "Unsupported architecture: $arch"
    exit 1
    ;;
esac

echo "Installing helm version 3.14.4 for ${architecture}"

curl -LO "https://get.helm.sh/helm-v3.14.4-linux-${architecture}.tar.gz"
tar -zxvf "helm-v3.14.4-linux-${architecture}.tar.gz"
sudo mv linux-${architecture}/helm /usr/local/bin/helm
rm -rf "helm-v3.14.4-linux-${architecture}.tar.gz" linux-${architecture}