#!/bin/bash

# Default values
container_tag="latest"
DOCKER_FILE_PATH="./Dockerfile"

# Parse named parameters
while [[ "$#" -gt 0 ]]; do
  case $1 in
    --container-name)
      container_image="$2"
      shift 2
      ;;
    --container-tag)
      container_tag="$2"
      shift 2
      ;;
    --docker-file-path)
      DOCKER_FILE_PATH="$2"
      shift 2
      ;;
    --working-dir)
      WORKING_DIR="$2"
      shift 2
      ;;
    *)
      echo "Unknown parameter: $1"
      echo "Usage: $0 --container-name <container_image> [--container-tag <tag>] [--working-dir <path>] [--docker-file-path <path>]"
      exit 1
      ;;
  esac
done

# Validate required parameters
if [ -z "$container_image" ]; then
  echo "Error: --container-name is required."
  echo "Usage: $0 --container-name <container_image> [--container-tag <tag>] [--docker-file-path <path>]"
  exit 1
fi

echo "Moving to working directory: $WORKING_DIR"
cd ${WORKING_DIR}
if [ $? -ne 0 ]; then
  echo "Error: Failed to change directory to $WORKING_DIR"
  exit 1
fi
echo "Current working directory: $(pwd)"

# Debug output (optional)
echo "Container Name: $container_image"
echo "Container Tag: $container_tag"
echo "Docker File Path: ${DOCKER_FILE_PATH:-Not provided}"

echo "Building container image: $container_image:$container_tag"
docker build -t "localhost:5000/$container_image:$container_tag" -f $DOCKER_FILE_PATH . 
echo "Built container image: localhost:5000/$container_image:$container_tag"


echo "Pushing container image to localhost:5000"
docker push "localhost:5000/$container_image:$container_tag"
echo "Pushed container image: localhost:5000/$container_image:$container_tag"
# && docker run -it --privileged --device /dev/gpiomem4:/dev/gpiomem4 "$container_image:$container_tag"