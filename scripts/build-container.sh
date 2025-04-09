container_image=$1
container_tag=$2
DOCKER_FILE_PATH=$3

if [ -z "$container_image" ]; then
  echo "Usage: $0 <container_image>"
  exit 1
fi

if [ -z "$container_tag" ]; then
  container_tag="latest"
fi

docker build -t "$container_image:$container_tag" -f $DOCKER_FILE_PATH . && docker run -it --privileged --device /dev/gpiomem4:/dev/gpiomem4 "$container_image:$container_tag"