echo "Detecting architecture..."
TARGET_ARCHITECTURE="amd64"
ARCH=$(uname -m)

if [[ "$ARCH" == "x86_64" ]]; then
    echo "amd64 architecture detected"
    TARGET_ARCHITECTURE="amd64"
elif [[ "$ARCH" == "aarch64" ]]; then
    echo "arm64 architecture detected"
    TARGET_ARCHITECTURE="arm64"
else
    echo "Unknown architecture: $ARCH"
    exit 1
fi

echo "Installing yq - version 4.44.2..."
curl -L https://github.com/mikefarah/yq/releases/download/v4.44.2/yq_linux_$TARGET_ARCHITECTURE >yq
sudo mv yq /usr/local/bin/
sudo chmod 755 /usr/local/bin/yq
rm -rf regctl
echo "Getting Version Information"
yq --version