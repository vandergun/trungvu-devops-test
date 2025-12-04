## Foundation Resources

- ECR: stores Docker images. --> create by tf
- ECS (Fargate): not available --> create by tf
- ALB: exist
- Other: provisions ECR, ECS cluster/service, task definition, and CloudWatch Log Group.
- GitHub Actions: automates build/test/provision/deploy.

## Setup GitHub Secrets

Set these under Repository → Settings → Secrets and variables → Actions → Secrets:

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

## GitHub Variables

Set these under Repository → Settings → Secrets and variables → Actions → Variables:

- TF_VAR_VPC_NAME — existing VPC name tag (required)
- TF_VAR_ALB_NAME — existing ALB name (required)
- TF_VAR_DOMAIN_NAME — domain for ALB/DNS (required)
- TF_VAR_AWS_REGION — region to deploy (optional, default: us-east-1)
- TF_VAR_APP_NAME — application name (optional, default: devops-test-app)

## Pipeline flow

1. Build & Test
   - Installs dependencies and runs unit tests.
2. Terraform (Provision Infrastructure)
   - Initializes Terraform backend (S3) and applies resources.
   - Outputs used by deploy: ECR repository URL, ECS cluster name, ECS service name, task definition family/ARN.
3. Deploy
   - Builds Docker image, tags with commit SHA and `latest`, pushes to ECR.
   - Downloads task definition, replaces image, and deploys updated task definition to ECS.
   - Waits for service stability.
