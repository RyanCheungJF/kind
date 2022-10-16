echo "Starting Setup for A2..."

echo "1. Create cluster:"
kind create cluster --name kind-1 --config k8s/kind/cluster-config.yaml
kubectl cluster-info
docker ps

echo "2. Deployment YAML:"
kubectl apply -f k8s/manifests/backend-deployment.yaml

echo "3. Service YAML:"
kubectl apply -f k8s/manifests/backend-service.yaml
kubectl get svc

echo "4. Ingress Controller:"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

echo "5. Ingress YAML:"
kubectl apply -f k8s/manifests/backend-ingress.yaml

echo "Test:"
curl http://localhost:80