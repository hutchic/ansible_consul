# ansible_consul

prerequisites

- virtualenv
- aws account
- hashicorp atlas account

just playing with ansible to setup consul

```
export AWS_ACCESS_KEY_ID: "aws_key_id"
export AWS_SECRET_ACCESS_KEY: "aws_secret_key"
export EC2_KEYPAIR_NAME: "insecure"
export QUAY_TOKEN=atlas_token
make run_ansible
```
