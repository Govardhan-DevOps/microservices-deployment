###this is used to create the docker image and push it to the docker hub.
docker login 
docker build -t pokharia83/microservices:v1 .
docker tag pokharia83/microservices:v1 pokharia83/microservices:v1
docker push pokharia83/microservices:v1


##this is used to created the deployment for kubernetes and scale up the applications
kubectl create deployment microservices  --image=pokharia83/microservices:v1  --dry-run -o yaml > deployment.yaml
scale containers using replica to 4
kubectl apply -f deployment.yaml   
