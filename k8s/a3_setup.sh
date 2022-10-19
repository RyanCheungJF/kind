# assumes a2 setup has been run

echo "Starting Setup for A3..."

echo "1. Distributer YAML:"
kubectl apply -f manifests/backend-zone-aware.yaml
kubectl get nodes -L topology.kubernetes.io/zone
kubectl get po -lapp=backend-zone-aware -owide --sort-by='.spec.nodeName'

# Metrics server
# kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# kubectl get po
# kubectl describe hpa

# kubectl -nkube-system edit deploy/metrics-server
# --kubelet-insecure-tls
# kubectl -nkube-system rollout restart deploy/metrics-server

# kubectl apply -f manifests/backend-hpa.yaml
# kubectl describe hpa