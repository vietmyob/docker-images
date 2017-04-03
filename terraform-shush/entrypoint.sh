#! /usr/bin/env sh

set -eu -o pipefail

# Setup remote state in artifactory
terraform init \
  -backend-config="bucket=$REMOTE_STATE_BUCKET" \
  -backend-config="key=$REMOTE_STATE_KEY" \
  -backend-config="kms_key_id=$KMS_KEY" \
  -backend-config="encrypt=true" \
  -backend-config="region=$TF_VAR_region"

# run the command decrypting KMS variables
shush --region $TF_VAR_region exec -- $@
