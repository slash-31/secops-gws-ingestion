# Google Workspace Security Operations Infrastructure

This repository contains Terraform configurations for setting up and managing security operations infrastructure in Google Cloud Platform (GCP) and Google Workspace. It automates the creation and configuration of service accounts, API enablement, and Google Workspace administrative roles necessary for security operations.

## Overview

The infrastructure setup includes:
- Service Account creation with appropriate permissions
- Secret Manager API enablement
- JWT storage in Secret Manager
- Google Workspace admin role creation ("SecOps-Impersonation")
- Domain-Wide Delegation configuration
- SecOps user creation with specific admin privileges

## Prerequisites

Before using this configuration, ensure you have:

1. [Terraform](https://www.terraform.io/downloads.html) (v1.0.0 or newer) installed
2. [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed
3. Access to the GCP project: `securitydude`
4. Google Workspace Admin privileges
5. Service Account key file: `terraform-securitydude-JWT.json`

## Setup Instructions

1. Clone this repository:
```bash
git clone <repository-url>
cd <repository-name>
```

2. Create a `creds` directory and add your service account key:
```bash
mkdir -p creds
# Copy your terraform-securitydude-JWT.json into the creds directory
```

3. Initialize Terraform:
```bash
cd terraform
terraform init
```

4. Review the planned changes:
```bash
terraform plan
```

5. Apply the configuration:
```bash
terraform apply
```

## Infrastructure Details

### GCP Resources
- Service Account: Created for security operations
- Secret Manager: Stores service account JWT
- APIs: Enables necessary Google Cloud APIs

### Google Workspace Resources
- Admin Role: "SecOps-Impersonation" with specific privileges:
  - Reports access
  - Alert Center view access
  - Mobile Device Management
  - Chrome Management
  - User and Group read access

- User: "SecOps-Ingestion-User" with custom admin role
- Domain-Wide Delegation: Configured with specific API scopes

## File Structure
```
.
├── terraform/
│   ├── providers.tf      # Provider configurations
│   ├── variables.tf      # Variable definitions
│   ├── service-account.tf# Service account setup
│   ├── api.tf           # API enablement
│   ├── secrets.tf       # Secret manager configuration
│   ├── workspace.tf     # Google Workspace resources
│   ├── outputs.tf       # Output definitions
│   └── terraform.tfvars # Variable values
└── creds/               # Credential storage (gitignored)
```

## Important Notes

- Never commit the contents of the `creds` directory
- Always review the `terraform plan` output before applying changes
- Store sensitive outputs securely after running `terraform apply`
- Regularly review and update API scopes and permissions

## Maintenance

To make changes to the infrastructure:

1. Create a new branch
2. Make your changes
3. Test using `terraform plan`
4. Create a pull request
5. Review and merge after approval

## Outputs

After applying the configuration, you'll receive:
- Service Account Unique ID
- Service Account Email
- SecOps User Password (store securely)

## Security Considerations

- Keep service account credentials secure
- Regularly rotate service account keys
- Review Domain-Wide Delegation permissions periodically
- Monitor admin role assignments
- Use least-privilege principle when modifying permissions

## Getting Help

If you encounter issues:
1. Verify credentials and permissions
2. Check Google Cloud Console audit logs
3. Review Terraform state
4. Confirm API enablement status

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the terms specified in the LICENSE file.
