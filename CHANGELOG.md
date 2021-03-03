---
# 0.4.0
# Main Changes
    - Set aws provider version to 3
    - upgrade submodules versions

# 0.3.0
# Main Changes
    - Add support for external KMS key for encryption

# 0.2.0
# Main Changes
    - Terraform v0.13.x support

# 0.1.1
## Main changes
    - output `kms_arn` depends only on `var.kms_encrypt`
    - added output `kms_arn_single`, which returns string. Left `kms_arn` for backward compatibility.
    - added output `kms_key_id`

## Deprecation warning
    - output `kms_arn` is not supported anymore


# 0.1.0

## Main changes
* Start
