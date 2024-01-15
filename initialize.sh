 export GITHUB_USER=aji-suprana
 export GITHUB_TOKEN=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

 flux bootstrap github \
  --components-extra=image-reflector-controller,image-automation-controller \
  --owner=$GITHUB_USER \
  --repository=testfluxcd \
  --branch=main \
  --path=clusters/my-cluster \
  --read-write-key \
  --personal

cat <<EOF > ./podinfo-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: podinfo
  namespace: default
spec:
  selector:
    matchLabels:
      app: podinfo
  template:
    metadata:
      labels:
        app: podinfo
    spec:
      containers:
        - name: podinfod
          image: ghcr.io/stefanprodan/podinfo:5.0.0
          imagePullPolicy: IfNotPresent
          ports:
            - name: http
              containerPort: 9898
              protocol: TCP
EOF