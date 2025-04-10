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

echo "Installing oras version 1.2.2 for $architecture"

curl -LO https://github.com/oras-project/oras/releases/download/v1.2.2/oras_1.2.2_linux_${architecture}.tar.gz
mkdir -p oras-install/
tar -zxf oras_1.2.2_*.tar.gz -C oras-install/
sudo mv oras-install/oras /usr/local/bin/
rm -rf oras_1.2.2_*.tar.gz oras-install/