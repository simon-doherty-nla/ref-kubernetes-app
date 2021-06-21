Spring Commands:
1) mvn spring-boot:run
2) curl localhost:9001/actuator/health
3) curl localhost:9000/hello-world

Docker commands locally:
1) docker build -t ref-app:1.0 .
2) docker run ref-app:1.0
- docker images

Docker cluster (minikube locally) to run an image locally that you have not uploaded to a container registry:
1) minikube start --driver=docker  							// [if you have a crio based runtime for the cluster then... minikube delete]
2) eval $(minikube docker-env)
3) docker build -t ref-app:1.0 .
4) kubectl apply -f deployment.yaml
5) minikube dashboard