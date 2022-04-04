# Setup App locally with kind

## Getting Started

1. Create cluster using config
```
kind create cluster --config kind-cluster.yaml --image kindest/node:v1.23.4
```

2. Create local registry
```
./kind-registry.sh
```

3. Apply configmap to store non-confidential data in key-value pairs
``` 
kubectl apply -f kind-registry.yaml
```

4. Build docker image using localhost tag
```
docker build -t localhost:5000/pyserver:0.1 .  
```

5. Push docker image into local registry
```
docker push localhost:5000/pyserver:0.1
```

6. Apply kind-service
```
kubectl apply -f kind-service.yaml
```

7. Apply ingress nginx
``` 
kubectl apply -f ingress-nginx.yaml
```

8. Load docker image into cluster
```
kind load docker-image localhost:5000/pyserver:0.1
```
## How to Test?

1. Make sure you can curl from localhost
```
curl localhost
```

> Expected behaviour

```
Hello, world!%
```

2. If you want to run on localhost from mac 

```
kubectl port-forward service/pyserver 8080:8080
```

> type localhost:8080 in browser