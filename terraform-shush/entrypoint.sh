#! /usr/bin/env sh

set -eu -o pipefail

# Setup remote state
terraform init \
  -backend-config "bucket=$REMOTE_STATE_BUCKET" \
  -backend-config "key=$REMOTE_STATE_KEY" \
  -backend-config "region=$TF_VAR_region"
  
# run the command decrypting KMS variables
shush --region $TF_VAR_region exec -- $@
