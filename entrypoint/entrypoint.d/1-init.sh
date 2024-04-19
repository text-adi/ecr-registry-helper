#!/usr/bin/env sh

echo "Check..."

# Set default value if not exist
if [ -z "${AWS_REGION}" ]; then
  default_value="eu-central-1"
  echo "AWS_REGION not set. Used default value - ${default_value}"
  AWS_REGION=$default_value
fi

if [ -z "${DOCKER_SECRET_NAME}" ]; then
  default_value="regcred"
  echo "DOCKER_SECRET_NAME not set. Used default value - ${default_value}"
  DOCKER_SECRET_NAME=$default_value
fi


# Check exist value
if [ -z "${NAMESPACE_NAME}" ]; then
  echo "NAMESPACE_NAME not set. Exit..."
  exit 1
fi

if [ -z "${AWS_ACCOUNT}" ]; then
  echo "AWS_ACCOUNT not set. Exit..."
  exit 1
fi

if [ -z "${AWS_ACCESS_KEY_ID}" ]; then
  echo "AWS_ACCESS_KEY_ID not set. Exit..."
  exit 1
fi

if [ -z "${AWS_SECRET_ACCESS_KEY}" ]; then
  echo "AWS_SECRET_ACCESS_KEY not set. Exit..."
  exit 1
fi
