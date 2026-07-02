---

# Terraform Workflow

### 1. Check Terraform Version

```bash
terraform version
```

---

### 2. Initialize Terraform

Downloads the required providers and initializes the working directory.

```bash
terraform init
```

---

### 3. Format Terraform Files

Formats all Terraform configuration files.

```bash
terraform fmt
```

To format all files recursively:

```bash
terraform fmt -recursive
```

---

### 4. Validate Configuration

Checks the syntax and validates the configuration.

```bash
terraform validate
```

---

### 5. Create an Execution Plan

Shows what Terraform will create, modify, or destroy.

```bash
terraform plan
```

Save the execution plan:

```bash
terraform plan -out=tfplan
```

---

### 6. Apply the Infrastructure

Create AWS resources.

```bash
terraform apply
```

Or apply the saved plan:

```bash
terraform apply tfplan
```

---

### 7. View Terraform State

List all managed resources.

```bash
terraform state list
```

Show details of a specific resource.

```bash
terraform state show aws_eks_cluster.eks_cluster
```

---

### 8. View Outputs

Display all outputs.

```bash
terraform output
```

Display a specific output.

```bash
terraform output cluster_name
```

---

### 9. Refresh State

Refresh the Terraform state from AWS.

```bash
terraform refresh
```

> **Note:** In newer Terraform versions, `terraform apply -refresh-only` is preferred.

```bash
terraform apply -refresh-only
```

---

### 10. Destroy Infrastructure

Delete all AWS resources created by Terraform.

```bash
terraform destroy
```

---

### 11. Clean Up Local Files (Optional)

```bash
rm -rf .terraform

rm -f terraform.tfstate*

rm -f .terraform.lock.hcl
```
