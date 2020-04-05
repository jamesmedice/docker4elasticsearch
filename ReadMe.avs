kubectl apply -f svc-cluster.yaml
kubectl apply -f svc-loadbalancer.yaml
kubectl apply -f es-sts-deployment.yaml


kubectl get svc elasticsearch-loadbalancer

curl 35.204.239.246/_cat/nodes?v
curl 35.204.239.246/_cat/indices?v


or  you  can run  a docker image 
kubectl run elasticsearch --image=docker.elastic.co/elasticsearch/elasticsearch:7.6.2 --env="discovery.type=single-node" --port=9200

kubectl get deployments

kubectl expose deployment elasticsearch --type=LoadBalancer

kubectl get pods --watch

export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')

curl http://localhost:8001/api/v1/proxy/namespaces/default/pods/$POD_NAME/
