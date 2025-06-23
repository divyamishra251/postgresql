# Terraform Modular VPC Infrastructure

This Terraform configuration creates a VPC infrastructure using modular design with separate modules for network, security, and compute resources.

## Structure

```
├── main.tf                    # Main configuration
├── variables.tf               # Root variables
├── outputs.tf                 # Root outputs
├── terraform.tfvars.example   # Example variables
└── modules/
    ├── network/               # Network module (VPC, subnets, gateways)
    ├── security/              # Security module (security groups)
    └── compute/               # Compute module (EC2 instances)
```

## Modules

### Network Module
- VPC with configurable CIDR
- Public and private subnets
- Internet Gateway and NAT Gateway
- Route tables and associations
- VPC peering to Jenkins VPC

### Security Module
- Public security group (all traffic)
- Private security group (VPC + Jenkins traffic)
- Jenkins communication security group

### Compute Module
- 1 public EC2 instance
- 2 private EC2 instances
- Basic web server configuration

## Usage

1. Copy the example variables:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` with your values

3. Deploy:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Required Variables

- `jenkins_vpc_id`: Your Jenkins VPC ID
- `jenkins_vpc_cidr`: Your Jenkins VPC CIDR block
- `jenkins_route_table_id`: Your Jenkins VPC route table ID