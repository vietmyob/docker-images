#! /usr/bin/env sh

set -eu -o pipefail

cleanup() {
  # make sure the state is pushed
  terraform remote push
}

trap cleanup EXIT

# Setup remote state in artifactory
terraform remote config \
  -backend=s3 \
  -backend-config="bucket=$REMOTE_STATE_BUCKET" \
  -backend-config="key=$REMOTE_STATE_KEY" \
  -backend-config="encrypt=true" \
  -backend-config="region=$TF_VAR_region"

# Try and pull the remote state if there is any
terraform remote pull

# run the command decrypting KMS variables
shush --region $TF_VAR_region exec -- $@

