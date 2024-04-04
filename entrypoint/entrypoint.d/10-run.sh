#!/usr/bin/env sh

fail_msg() {
  echo "Error - $1! Exit..."
  exit 1
}

echo "Run command for update secret..."

ECR_TOKEN=$(aws ecr get-login-password --region "${AWS_REGION}") || fail_msg "AWS login"
kubectl delete secret --ignore-not-found "${DOCKER_SECRET_NAME}" -n "${NAMESPACE_NAME}" || fail_msg "Delete k8s secret"
kubectl create secret docker-registry "${DOCKER_SECRET_NAME}" \
  --docker-server=https://"${AWS_ACCOUNT}".dkr.ecr."${AWS_REGION}".amazonaws.com \
  --docker-username=AWS \
  --docker-password="${ECR_TOKEN}" \
  --namespace="${NAMESPACE_NAME}" || fail_msg "Create k8s secret"
