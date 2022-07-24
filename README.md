# DevOps test

## Prerequirements and environment setup
* Docker Desktop for Mac/Win
* minikube

Minikube on Windows requires editing *hosts* file with the host set in *ingress-service.yaml*
```bash
> minikube ip # set this IP in hosts file
```
## CI/CD

### Continuous Integration
Using CirlceCI triggered to build on each push to the master branch
* running tests
* building images using Docker and Docker Compose
* automatic version tagging
* pushing images to Docker Hub

### Continuous Deployment
Deployment using Docker Compose
```bash
> ./deploy.sh --version_service1=latest --version_service2=latest # or pick the version from Docker Hub
```

Deployment using Minikube and K8s (minikube should only be used for development)
```bash
> ./deploy-k8s.sh --version_service1=latest --version_service2=latest # or pick the version from Docker Hub
```

### Running Kubernetes might require setup of minikube ingress controller and port forwarding
```bash
> kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.0/deploy/static/provider/cloud/deploy.yaml
> minikube addons enable ingress
> kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
```
