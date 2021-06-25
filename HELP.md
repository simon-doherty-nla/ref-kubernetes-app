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

Setup a local container registry
1) https://shashanksrivastava.medium.com/create-a-local-docker-registry-on-mac-74cbeac86bfc
2) sudo docker compose up


Install rancher on Mac
1) https://itnext.io/rancher-2-4-kubernetes-on-your-macos-laptop-with-docker-k3d-b578b1c7568b

Provision multiple k3s clusters with k3d
