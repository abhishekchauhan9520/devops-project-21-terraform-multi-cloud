# Remote State & Locking

Each cloud example is intentionally independent so users can understand the provider-specific state boundary.

For shared/team environments, store state in a protected remote backend appropriate to the cloud and organization. Enable encryption, versioning where supported, restricted access, and state locking/coordination. Never commit `.tfstate`, credentials, or `terraform.tfvars` containing secrets.
