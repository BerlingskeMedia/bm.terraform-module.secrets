---
# 0.2.0
## Main changes
    - Update modules for Terraform 0.13 support

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
