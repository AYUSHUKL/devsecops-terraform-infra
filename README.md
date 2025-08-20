# AWS CI/CD Infra (Jenkins EC2) with Terraform + GitHub Actions

This repo provisions a Jenkins host on AWS via Terraform and deploys it via GitHub Actions.
- VPC + public subnet + IGW + route
- SG (22, 80, 443, 8080 from `allowed_cidrs`)
- EC2 Ubuntu 22.04 + 30GB root + 512GB data EBS
- Runs your `install-script.sh` at first boot
- Elastic IP output

## Prereqs
1. Create an **OIDC IAM Role** in AWS to allow GitHub Actions to assume it (see `iam/role-trust.json` & `iam/policy.json`). Store the Role ARN in GitHub secret `AWS_ROLE_TO_ASSUME`.
2. Create (or let the workflow create) S3 bucket and DynamoDB table for Terraform state.
3. Set GitHub Secrets:
   - `AWS_ACCOUNT_ID`
   - `AWS_ROLE_TO_ASSUME` (e.g. `arn:aws:iam::<acct>:role/github-actions-terraform`)
   - `AWS_REGION` (e.g. `us-east-1`)
   - `TF_STATE_BUCKET` (unique S3 bucket name for state)
   - `TF_STATE_TABLE` (DynamoDB table name for state locks)
   - `TF_VAR_key_name` (your EC2 key pair name)

## Workflows
- PRs → **Plan only**
- Push to `main` → **Apply** (protected with environment `prod`)

## Local dev (optional)
```bash
terraform init -backend-config=backend.hcl
terraform plan  -var 'key_name=devsecops-key'
terraform apply -auto-approve -var 'key_name=devsecops-key'
```
