# assumes a2 setup has been run

echo "Starting Setup for A3..."

echo "1. Distributer YAML:"
kubectl apply -f manifests/backend-zone-aware.yaml
kubectl get nodes -L topology.kubernetes.io/zone
kubectl get po -lapp=backend-zone-aware -owide --sort-by='.spec.nodeName'