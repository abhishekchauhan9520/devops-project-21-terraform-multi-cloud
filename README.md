# Project 21 — Terraform Multi-Cloud Infrastructure (AWS, Azure, GCP)

A structured Terraform lab showing the same infrastructure concept across **AWS, Microsoft Azure, and Google Cloud** without pretending the three clouds have identical APIs.

## What this project demonstrates

- Provider isolation and version pinning
- Reusable Terraform modules per cloud
- Independent state boundaries per cloud example
- Cloud-specific networking/resource assumptions made explicit
- Credential handling through provider-supported authentication, not committed secrets
- Safe SSH defaults on AWS through an explicit CIDR variable
- Azure Linux VM with SSH-key authentication
- GCP Compute Engine VM using the default VPC as an explicit data dependency
- Formatting, initialization, and validation automation
- Manual plan/apply workflow to avoid accidental cross-cloud spending

## Layout

```text
providers/                Shared provider/version reference
modules/aws/              AWS EC2 module
modules/azure/            Azure Linux VM module
modules/gcp/              GCP Compute Engine module
examples/aws/             Independent AWS root module
examples/azure/           Independent Azure root module
examples/gcp/             Independent GCP root module
scripts/                  Validation/init/plan/apply helpers
tests/                    Offline repository checks
docs/                     Remote-state guidance
.github/workflows/        CI validation
```

## Important operating model

**Do not run all three examples together.** Each folder is an independent Terraform root and therefore an independent state boundary. Deploy one cloud at a time, review `terraform plan`, and destroy lab resources after use.

No credentials are stored in this repository. Use the official authentication mechanisms for each provider (for example AWS environment/role credentials, Azure CLI or OIDC/service principal, and Google ADC/service account credentials). The Azure provider supports Azure CLI and OIDC-style authentication among its supported methods.

## Provider versions

The repository pins the current provider versions reviewed on **August 24, 2026**:

- AWS `6.60.0`
- AzureRM `5.0.1`
- Google `7.44.0`

## Local validation

Run:

```bash
bash tests/test_project.sh
bash scripts/validate_fmt.sh
```

Terraform CLI is required for `init`, `validate`, `plan`, and `apply`.

## Example workflow

For one cloud only:

```bash
cd examples/aws
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
terraform destroy
```

Repeat with `examples/azure` or `examples/gcp` using the credentials and required inputs for that provider.

## CI

GitHub Actions validates formatting, initializes each example without a backend, and runs `terraform validate`. It intentionally does **not** create cloud resources or require your cloud credentials. Provider-specific `plan` and `apply` remain manual operations.

## Security/cost notes

- Never commit `terraform.tfvars` containing secrets.
- Restrict SSH to a real administrative CIDR; do not change the AWS CIDR to `0.0.0.0/0` for convenience.
- Review every plan before apply.
- Use remote encrypted state and locking for shared/team environments.
- Destroy lab resources when finished.
