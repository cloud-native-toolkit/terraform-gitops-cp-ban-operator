#!/usr/bin/env bash
echo "**************** Starting create-yaml.sh **************************"
NAME="$1"
DEST_DIR="$2"
NAMESPACE="$3"
CHART_DIR="$4"

mkdir -p "${DEST_DIR}"

echo ">>>>>>>> ${DEST_DIR} ${NAMESPACE} ${NAME}"
#PARMLENGTH=$(echo "${PARMS}" | jq '. | length')

#if [[ ${PARMLENGTH} != 0 ]]; then

#cat >> ${DEST_DIR}/pvc_operator.yaml << EOL
#parameters: $(echo "${PARMS}" | jq -c 'from_entries')
#EOL
#fi 
cp -R "${CHART_DIR}"/* "${DEST_DIR}"
echo "Created Destination Directory ${DEST_DIR}"
#if [[ -n "${VALUES_CONTENT}" ]]; then
#  echo "${VALUES_CONTENT}" > "${DEST_DIR}/iaf-operator.yaml" 
#fi 


################ Adding PVC Creation ot the base create-yaml temporarily

echo "Destination directory is ${DEST_DIR}"
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
