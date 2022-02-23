#!/usr/bin/env bash

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

#if [[ -n "${VALUES_CONTENT}" ]]; then
#  echo "${VALUES_CONTENT}" > "${DEST_DIR}/iaf-operator.yaml"
#fi 

cat > "${DEST_DIR}/iaf-operator.yaml" << EOL
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: ibm-automation
  namespace: gitops-cp-ban-operator
  annotations:
spec:
      channel: v1.3
      installPlanApproval: Automatic
      #name: ibm-automation-foundation-core
      name: ibm-automation
      source: ibm-operator-catalog
      #source: iaf-core-operators
      sourceNamespace: openshift-marketplace
EOL

