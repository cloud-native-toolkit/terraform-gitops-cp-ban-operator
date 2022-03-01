#!/usr/bin/env bash

NAME="$1"
DEST_DIR="$2"
STORAGECLASS="$3"
NAMESPACE="$4"


mkdir -p "${DEST_DIR}"

cat > "${DEST_DIR}/pvc_operator_log.yaml" << EOL

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: cp4a-shared-log-pvc
  namespace:'${NAMESPACE}'
  labels:
    app.kubernetes.io/instance: ibm-dba
    app.kubernetes.io/managed-by: ibm-dba
    app.kubernetes.io/name: ibm-dba
    release: 21.0.3
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: '${STORAGECLASS}'
  resources:
    requests:
      storage: 100Gi
EOL

cat > "${DEST_DIR}/pvc_operator_shared.yaml" << EOL

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: operator-shared-pvc
  namespace:'${NAMESPACE}'
  labels:
    app.kubernetes.io/instance: ibm-dba
    app.kubernetes.io/managed-by: ibm-dba
    app.kubernetes.io/name: ibm-dba
    release: 21.0.3
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: '${STORAGECLASS}'
  resources:
    requests:
      storage: 1Gi

EOL
