
# House of IAC

Infrastructure-as-Code repository using **Terraform** and **Terragrunt** to provision and manage Kubernetes clusters and applications on **OVHcloud**.

---

## 📁 Project Structure

```bash
infrastructure/
├── live/                # Environment-specific configurations (dev, prod)
│   ├── dev/
│   │   ├── apps/        # Apps deployed in dev
│   │   │   ├── cert-manager/
│   │   │   └── prometheus-stack/
│   │   └── infra/       # Infrastructure resources (cluster, ingress, etc.)
│   │       ├── ingress-nginx/
│   │       ├── k8s-ovh/
│   │       └── s3/
│   └── prod/
│       ├── apps/
│       └── k8s-ovh/
└── modules/             # Reusable Terraform modules
    ├── cert-manager/
    ├── ingress-nginx/
    ├── k8s-ovh/
    ├── prometheus-stack/
    └── s3/
```

---

## ⚙️ Prerequisites

- [Terraform](https://www.terraform.io/) >= 1.4.x
- [Terragrunt](https://terragrunt.gruntwork.io/) >= 0.45.x
- `kubectl` configured with your OVH K8S cluster
- Access to OVHCloud Public Cloud API
- Helm (required for some modules)
- OVH project and Kubernetes cluster created (can be done via Terraform)

---

## 🚀 Getting Started

### 1. Set OVH Credentials

To use the OVH provider in Terraform, you need to define your OVH credentials in your environment variables, such as in your `bashrc` file or another script that gets sourced in your terminal session.

Add the following to your `~/.bashrc` (or equivalent shell configuration file):

```bash
# OVH Credentials for Terraform
export TF_VAR_ovh_service_name="xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
export TF_VAR_ovh_endpoint="ovh-eu"
export TF_VAR_ovh_application_key="xxxxxxxxxxxxxxxxxxxxxxxxxx"
export TF_VAR_ovh_application_secret="xxxxxxxxxxxxxxxxxxxxxxxxxx"
export TF_VAR_ovh_consumer_key="xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

After adding the credentials, run `source ~/.bashrc` to load the variables.

---

### 2. Create the Kubernetes Cluster on OVH

```bash
cd live/dev/infra/k8s-ovh
Modify the configuration file terragrunt.hcl to fit your environment and infrastructure requirements.
terragrunt plan
terragrunt apply
```

This uses the `k8s-ovh` module to provision a managed Kubernetes cluster on OVHCloud.

---

### 3. Deploy the Ingress Controller (NGINX)

```bash
cd live/dev/infra/ingress-nginx
Modify the configuration file terragrunt.hcl to fit your environment and infrastructure requirements.
terragrunt plan
terragrunt apply
```

This deploys the NGINX ingress controller using Helm.

---

### 4. Install cert-manager

```bash
cd live/dev/apps/cert-manager
Modify the configuration file terragrunt.hcl to fit your environment and infrastructure requirements.
terragrunt plan
terragrunt apply
```

You can define your certificate issuers inside the module at:

```
modules/cert-manager/issuer.yaml
```

---

### 5. Set up Monitoring (Prometheus + Grafana)

```bash
cd live/dev/apps/prometheus-stack
Modify the configuration file terragrunt.hcl to fit your environment and infrastructure requirements.
terragrunt plan
terragrunt apply
```

Once deployed, you can access the dashboards locally using port-forward:

```bash
./grafana-port-forward.sh
./prometheus-port-forward.sh
```

---

## 🧩 Modules Overview

Each module in `modules/` encapsulates reusable Terraform logic:

- `k8s-ovh`: Provision Kubernetes cluster on OVHCloud
- `ingress-nginx`: Deploy ingress controller via Helm
- `cert-manager`: Deploy cert-manager and create issuers
- `prometheus-stack`: Monitoring stack with Prometheus & Grafana
- `s3`: Manage OVH-compatible S3 buckets

---

## 🏗 Environments

- `dev`: Development and test infrastructure
- `prod`: Production infrastructure (mirrors dev layout)

---

## 🛠 Usage

To deploy or update a component:

```bash
cd live/<env>/<apps|infra>/<component>
Modify the configuration file terragrunt.hcl to fit your environment and infrastructure requirements.
terragrunt plan
terragrunt apply
```

---

## 🧑‍💼 Best Practices

- Use environment variables or secrets manager to pass sensitive data.
- Avoid committing `.tfvars` files or secrets.
- Each `terragrunt.hcl` points to a specific module and overrides variables as needed.
- Use the `get_helm.sh` script in `infra/ingress-nginx` if Helm is not installed.

---

## 📄 License

MIT
