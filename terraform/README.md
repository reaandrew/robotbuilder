# Robot Builder V9 - Terraform Infrastructure

This Terraform configuration deploys the Robot Builder V9 application as a static website on AWS with:

- **S3 bucket** for static website hosting
- **CloudFront distribution** for global CDN and HTTPS
- **SSL certificate** via AWS Certificate Manager
- **Route53 DNS** record for custom subdomain
- **Automated deployment** of the HTML file

## Architecture

```
robotbuilder.jackrea.co.uk (Route53)
           ↓
    CloudFront Distribution (SSL/CDN)
           ↓
       S3 Static Website
```

## Prerequisites

1. **AWS CLI configured** with appropriate credentials
2. **Terraform installed** (>= 1.0)
3. **Existing Route53 hosted zone** for `jackrea.co.uk`
4. **AWS permissions** for:
   - S3 bucket management
   - CloudFront distributions
   - Route53 DNS records
   - ACM certificate management

## Quick Start

1. **Navigate to terraform directory:**
   ```bash
   cd terraform
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Review the plan:**
   ```bash
   terraform plan
   ```

4. **Apply the configuration:**
   ```bash
   terraform apply
   ```

5. **Confirm when prompted** and wait for deployment (5-15 minutes)

## Configuration

### Variables

All variables have sensible defaults but can be customized:

- `aws_region` - AWS region (default: `eu-west-2`)
- `domain_name` - Root domain (default: `jackrea.co.uk`)
- `subdomain` - Full subdomain (default: `robotbuilder.jackrea.co.uk`)
- `environment` - Environment name (default: `production`)
- `project_name` - Project identifier (default: `robot-builder`)

### Custom Configuration

Create a `terraform.tfvars` file to override defaults:

```hcl
aws_region = "us-east-1"
subdomain = "robots.example.com"
```

## Resources Created

| Resource | Purpose |
|----------|---------|
| `aws_s3_bucket` | Static website hosting |
| `aws_cloudfront_distribution` | Global CDN with SSL |
| `aws_acm_certificate` | SSL certificate |
| `aws_route53_record` | DNS routing |
| `aws_s3_object` | HTML files upload |

## Post-Deployment

After successful deployment:

1. **Website will be available** at: `https://robotbuilder.jackrea.co.uk`
2. **SSL certificate** will be automatically validated
3. **CloudFront CDN** will cache content globally
4. **Route53** will resolve the custom domain

## Updating the Website

To update the robot builder application:

1. **Modify** `robot-builder-v9.html`
2. **Re-run** `terraform apply`
3. **Invalidate CloudFront cache** (optional for immediate updates):
   ```bash
   aws cloudfront create-invalidation --distribution-id <DISTRIBUTION_ID> --paths "/*"
   ```

## Cleanup

To destroy all resources:

```bash
terraform destroy
```

## Troubleshooting

### Common Issues

1. **Certificate validation timeout**: Check Route53 hosted zone exists
2. **Permission denied**: Ensure AWS credentials have required permissions
3. **Domain already exists**: Check for existing DNS records

### Verification

```bash
# Check website is live
curl -I https://robotbuilder.jackrea.co.uk

# Verify SSL certificate
openssl s_client -connect robotbuilder.jackrea.co.uk:443 -servername robotbuilder.jackrea.co.uk

# Check DNS resolution
dig robotbuilder.jackrea.co.uk
```

## Costs

Estimated monthly costs (minimal traffic):
- S3 hosting: ~$0.50
- CloudFront: ~$1.00
- Route53: ~$0.50
- ACM certificate: Free

**Total: ~$2.00/month**

## Security Features

- ✅ HTTPS enforced (HTTP redirects to HTTPS)
- ✅ TLS 1.2+ minimum protocol
- ✅ CloudFront Origin Access Control
- ✅ S3 bucket not directly accessible
- ✅ Custom error pages

## Support

For issues:
1. Check AWS CloudFormation events
2. Review Terraform state: `terraform show`
3. Validate AWS permissions
4. Check Route53 hosted zone configuration