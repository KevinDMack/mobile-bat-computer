if docker --version >/dev/null 2>&1; then
    echo "Docker is installed, skipping the step."
else
    echo "Installing docker - version 26.1.3..."
    echo ""

    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    APT_DOCKER_INSTALL_VERSION=$(apt-cache madison docker-ce | awk '{ print $3 }' | grep "26.1.3")
    sudo apt-get install docker-ce=$APT_DOCKER_INSTALL_VERSION docker-ce-cli=$APT_DOCKER_INSTALL_VERSION containerd.io docker-buildx-plugin docker-compose-plugin -y

    echo "Setup docker group"
    sudo usermod -aG docker $USER
    echo "running newgrp docker..."
    newgrp docker
    sudo chmod 666 /var/run/docker.sock
fi