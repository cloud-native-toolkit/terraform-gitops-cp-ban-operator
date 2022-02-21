#!/usr/bin/env bash

NAME="$1"
DEST_DIR="$2"
STORAGECLASS="$3"
NAMESPACE="$4"


mkdir -p "${DEST_DIR}"

cat > "${DEST_DIR}/iaf_operator_subscription.yaml" << EOL

apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: ibm-automation
  namespace: cp4automation
spec:
  channel: v1.3
  installPlanApproval: Automatic
  name: ibm-automation
  source: ibm-operator-catalog
  sourceNamespace: openshift-marketplace

EOL

PARMLENGTH=$(echo "${PARMS}" | jq '. | length')

if [[ ${PARMLENGTH} != 0 ]]; then

cat >> ${DEST_DIR}/pvc_operator.yaml << EOL
parameters: $(echo "${PARMS}" | jq -c 'from_entries')
EOL
fi 