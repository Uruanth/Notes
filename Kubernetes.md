# Kubernetes

## Imperativa

Crear un deploy de manera imperativa, esto crea un archivo yaml, con el deploy. 

```shell
kubectl create deployment <name> --image=mysql:8 --port=3306 --dry-run=client -o yaml > deployment-test.yaml
```

Datos que se pueden retirar del archivo resultante:

* creationTimestamp (tambien el del template)

* label (la del template no se borra)

* strategy

* status

* resources

Asi quedaria un yml de MySQL 8

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql8
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysql8
  template:
    metadata:
      labels:
        app: mysql8
    spec:
      containers:
      - image: mysql:8
        name: mysql
        ports:
        - containerPort: 3306
        env:
          - name: MYSQL_ROOT_PASSWORD
            value: sasa
          - name: MYSQL_DATABASE
            value: test
```

### Services

Mediante el cual se pueden conectar los pods a otros o exponerse a la red.

Hay 3 tipos de type al exponer:

* ClusterIP: Permite solo una comunicación interna entre el cluster

* NodePort: Para comunicación externa

* LoadBalancer: Soporta pods distribuidos, mas eficiente, no todos los proveedores lo soportan



```shell
kubectl expose deployment mysql8 --port=3306 --type=ClusterIP
```

| asd | asd

## Comandos comunes

```shell
# Get pods
kubectl get pods
# Get services
kubectl get svc 
kubectl get services


# Get deployment
kubectl get deployment


# describe
kubectl describe pod | deployment | service <name>

# Get all
kubectl get all

# Aumentar replicas
kubeclt scale deployment <name> --replicas=2
```





## Minikube

El host para conectarse con minikube

```shell
minikube service <name> --url
```

