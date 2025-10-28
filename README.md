# Azure Local Demo

## Overview

This repository contains Bicep templates and scripts for deploying and managing Azure Arc-enabled infrastructure, including AKS clusters, virtual machines, custom and marketplace images, and networking resources. It is designed for hybrid and edge scenarios using Azure Local and Azure Arc.

## Repository Structure

- **`.github/workflows/`**
  GitHub Actions workflows for automated deployment of all infrastructure components.

- **`aks/`**
  Bicep templates and PowerShell scripts for deploying Azure Arc-enabled Kubernetes clusters (AKS Arc).

- **`localbox/`**
  Bicep templates for deploying local infrastructure, including host, management, and network resources.

- **`networking/`**
  Templates for logical network and static network resource deployment.

- **`storage/`**
  Templates for deploying custom and marketplace images for VMs.

- **`virtual_machines/`**
  Bicep templates and parameter files for deploying VMs with various configurations.

## Prerequisites

- GitHub repository with required secrets configured
- Azure subscription with permissions to deploy resources and manage Azure Arc
- Access to Azure portal for service principal/Managed Identity creation

## Key Components

### AKS Arc Clusters
Deploy Azure Kubernetes Service clusters on Azure Stack HCI with:
- Configurable control plane and node pool settings
- Support for both Linux and Windows node pools
- Load balancer configuration with MetalLB
- SSH key-based authentication

### Local Infrastructure
Complete local environment setup including:
- Host configuration with Azure Stack HCI
- Management artifacts and storage accounts
- Customer usage attribution tracking
- Network configuration with logical networks

### Virtual Machines
Deploy VMs with:
- Support for both custom and marketplace images
- Domain join capabilities
- Data disk configuration
- Azure Arc VM extension support

### Networking
Logical network deployment with:
- Static IP configuration
- VLAN support
- DNS server configuration
- Virtual IP pool management

### Storage Images
Image management for:
- Custom VM images from local paths
- Azure Marketplace images
- Windows Server 2025 Datacenter Azure Edition
- Ubuntu 24.04 LTS

## Usage

This repository uses GitHub Actions workflows for automated infrastructure deployment. Follow these steps to deploy your Azure Arc infrastructure:

### Step 1: Configure GitHub Actions Secrets

Before running any workflows, configure the following secrets in your GitHub repository:

1. Go to **Settings** > **Secrets and variables** > **Actions** in your GitHub repository
2. Add the following repository secrets:

**Required Secrets:**
- `AZURE_CLIENT_ID` - Service Principal Client ID
- `AZURE_TENANT_ID` - Azure AD Tenant ID
- `AZURE_SUBSCRIPTION_ID` - Target Azure Subscription ID

**Additional Secrets (as needed):**
- `SSH_PUBLIC_KEY` - SSH public key for AKS clusters
- `WINDOWS_ADMIN_PASSWORD` - Password for Windows VMs
- `DOMAIN_JOIN_PASSWORD` - Password for domain join operations

### Step 2: Customize Bicep Parameter Files

Review and customize the parameter files for your environment:

**QA Environment Parameters:**
- `aks/qa01.bicepparam` - AKS Arc cluster configuration
- `localbox/qa01.bicepparam` - Local infrastructure settings
- `networking/static/qa-vm-network.bicepparam` - VM networking
- `networking/static/qa-aks-network.bicepparam` - AKS networking
- `virtual_machines/*_qa.bicepparam` - VM configurations
- `storage/images/*/qa-*.bicepparam` - Image configurations

**Production Environment Parameters:**
- `aks/prod01.bicepparam` - Production AKS cluster
- `virtual_machines/git01.bicepparam`, `mgmt01.bicepparam`, etc. - Production VMs

### Step 3: Run Workflows

Navigate to **Actions** tab in your GitHub repository and manually trigger the appropriate workflow:

#### Available Workflows:

**Infrastructure Deployment:**
- `Deploy Azure Local - qa` - Deploy local infrastructure (localbox)
- `Deploy Azure Local Logical Networks - qa` - Deploy networking resources

**AKS Deployment:**
- `Deploy Azure Local AKS - qa` - Deploy QA AKS Arc cluster
- `Deploy Azure Local AKS - prod` - Deploy production AKS Arc cluster

**VM Image Deployment:**
- `Deploy Azure Local VM Images - qa` - Deploy custom and marketplace images

**VM Deployment:**
- `Deploy Azure Local VMs - qa` - Deploy QA virtual machines
- `Deploy Azure Local VMs - prod` - Deploy production virtual machines

#### Deployment Order:

1. **First:** Run `Deploy Azure Local - qa` (local infrastructure)
2. **Second:** Run `Deploy Azure Local Logical Networks - qa` (networking)
3. **Third:** Run `Deploy Azure Local VM Images - qa` (images)
4. **Fourth:** Run `Deploy Azure Local VMs - qa` or `Deploy Azure Local AKS - qa` (workloads)

Each workflow can be triggered manually via the GitHub Actions UI with workflow_dispatch.

## Parameter Files

The repository includes parameter files for different environments:

### QA Environment
- `qa01.bicepparam` - AKS Arc cluster
- `qa-vm-network.bicepparam` - VM networking
- `qa-aks-network.bicepparam` - AKS networking
- `*_qa.bicepparam` - QA VM configurations

### Production Environment
- `prod01.bicepparam` - Production AKS cluster
- `git01.bicepparam`, `mgmt01.bicepparam`, etc. - Production VM configurations

## Best Practices

1. **Security**: Always use secure parameters for passwords and sensitive data
2. **Resource Naming**: Follow consistent naming conventions across environments
3. **Network Planning**: Plan IP address ranges and VLAN configurations carefully
4. **Resource Groups**: Use separate resource groups for different environments
5. **Monitoring**: Enable Azure Monitor and Log Analytics for deployed resources

## Troubleshooting

### Common Issues

**GitHub Actions Workflow Failures**

- Verify all required secrets are properly configured
- Check service principal/Managed Identity permissions for target resource groups
- Ensure parameter files have correct values for your environment
- Review workflow logs for specific error messages

**AKS Arc Deployment**

- Verify custom location and logical network names
- Ensure SSH public key is properly formatted
- Check Azure Arc connectivity

**VM Deployment**

- Verify image availability in the specified location
- Check logical network configuration
- Ensure custom location permissions

**Network Configuration**

- Validate VLAN and IP range settings
- Verify VM switch name matches your environment
- Check DNS server accessibility

### Monitoring Deployments

- Use the **Actions** tab in GitHub to monitor workflow progress
- Review deployment logs for detailed information
- Check Azure portal for resource deployment status
- Use Azure Resource Graph Explorer for resource queries

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test deployments in a development environment
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For issues and questions:
- Check the troubleshooting section above
- Review Azure Local and Azure Arc documentation
- Open an issue in this repository for bugs or feature requests
