# AGENTS.md - because-daddy-said-so-landing

## Purpose
Static landing site on S3 + CloudFront + Route53 via Terraform.

## Deployment (GitHub Actions + OIDC)
- CloudFormation template: `infra/terraform-iam-user.yaml`
- Role: `terraform-bds-landing-gha`
- GitHub OIDC trust: repo `ClawHammer-64/because-daddy-said-so-landing`, branch `main`
- Workflow: `.github/workflows/deploy.yml`
- Required repo secret: `AWS_ROLE_ARN` (role ARN from CF output)
- AWS region for resources: **us-east-2**
- ACM for CloudFront **must stay in us-east-1** (provider alias in `infra/main.tf`)

## DNS
- Route53 hosted zone created by Terraform
- Registrar must delegate nameservers to the Route53 NS records (4 values)
- Until delegation propagates, domain won’t resolve to CloudFront

## Terraform state
- Backend bucket/key configured in `infra` (S3)
- If resources already exist, import them:
  - `terraform import aws_s3_bucket.site <bucket_name>`
  - `terraform import aws_cloudfront_origin_access_control.oac <oac_id>`

## Notes
- S3 + CloudFront permissions are currently full access in the OIDC role (restricted by repo trust policy).
