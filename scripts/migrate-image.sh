# docker save -o flashlight.tar flashlight:latest
# sudo ctr images import flashlight.tar
# sudo rm flashlight.tar
# sudo ctr images list | grep flashlight
# kubectl apply -f /home/kemack/bat-computer/apps/flashlight/flashlight.yaml


docker run -d -p 5000:5000 --name registry registry:2
docker ps | grep registry
docker tag flashlight:latest localhost:5000/flashlight:latest
docker push localhost:5000/flashlight:latest

# image: localhost:5000/flashlight:latest