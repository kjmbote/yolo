# Running Backend Service with MongoDB on Kubernetes

## Prerequisites
1. Google Kubernetes Engine (GKE) cluster is set up and configured.
2. `kubectl` is installed and configured to connect to the GKE cluster.
3. Docker images for the backend service and MongoDB are available in a container registry (e.g., Docker Hub).

## Steps

### 1. Create a Namespace
```bash
kubectl create namespace my-backend
```

### 2. Apply MongoDB PVC
```bash
kubectl apply -f mongodb/mongodb-pvc.yaml -n my-backend
```

### 3. Apply MongoDB StatefulSet
```bash
kubectl apply -f mongodb/mongodb-statefulset.yaml -n my-backend
```

### 4. Apply MongoDB Service
```bash
kubectl apply -f mongodb/mongodb-service.yaml -n my-backend
```

### 5. Apply Backend Deployment
```bash
kubectl apply -f backend/backend-deployment.yaml -n my-backend
```

### 6. Apply Backend Service
```bash
kubectl apply -f backend/backend-service.yaml -n my-backend
```

### 7. Verify Deployment
```bash
kubectl get pods -n my-backend
kubectl get services -n my-backend
```




# Running Frontend Service on Kubernetes

## Prerequisites
1. Google Kubernetes Engine (GKE) cluster is set up and configured.
2. `kubectl` is installed and configured to connect to the GKE cluster.
3. Docker image for the frontend service is available in a container registry (e.g., Docker Hub).
4. Backend service is deployed and accessible.

## Steps

### 1. Create a Namespace
```bash
kubectl create namespace my-frontend
```

### 2. Apply Frontend Deployment
```bash
kubectl apply -f frontend/frontend-deployment.yaml -n my-frontend
```

### 3. Apply Frontend Service
```bash
kubectl apply -f frontend/frontend-service.yaml -n my-frontend
```

### 4. Verify Deployment
```bash
kubectl get pods -n my-frontend
kubectl get services -n my-frontend
```

### 5. Access Frontend Service
Access the frontend service via the service's external IP or DNS name obtained from step 4.

Below is a step-by-step guide in Markdown format for running the Kubernetes manifests for MongoDB as the database:

# Running MongoDB Database on Kubernetes

## Prerequisites
1. Google Kubernetes Engine (GKE) cluster is set up and configured.
2. `kubectl` is installed and configured to connect to the GKE cluster.

## Steps

### 1. Create a Namespace
```bash
kubectl create namespace mongodb
```

### 2. Apply MongoDB PVC
```bash
kubectl apply -f mongodb/mongodb-pvc.yaml -n mongodb
```

### 3. Apply MongoDB StatefulSet
```bash
kubectl apply -f mongodb/mongodb-statefulset.yaml -n mongodb
```

### 4. Apply MongoDB Service
```bash
kubectl apply -f mongodb/mongodb-service.yaml -n mongodb
```

### 5. Verify Deployment
```bash
kubectl get pods -n mongodb
kubectl get services -n mongodb
```

### 6. Access MongoDB
Access MongoDB by connecting to one of the pods in the StatefulSet and using the service's DNS name.