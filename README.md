# 🚀 Fargate Terraform Node.js App

This project is a fully containerized, cloud-native Node.js web application deployed to AWS using:

- **AWS Fargate** (ECS)
- **Terraform** (Infrastructure as Code)
- **Docker** (App Containerization)
- **GitHub Actions** (CI/CD Pipeline)
- **Amazon ECR** (Docker Registry)
- **Application Load Balancer (ALB)** (Public Routing)

---

## 🌍 Live Demo

> http://<your-alb-dns>

_(Replace with your actual ALB DNS from Terraform output)_

---

## 🧱 Project Architecture

```
GitHub → GitHub Actions → Docker Build → ECR → ECS Fargate → ALB → Web
Terraform → VPC, ECS, ECR, ALB, SGs
```

---

## 📦 Tech Stack

- AWS ECS + Fargate
- AWS ECR
- AWS ALB
- Terraform
- Docker
- GitHub Actions
- Node.js + Express

---

## 🛠️ Setup Instructions

### 📁 Project Structure

```
fargate-terraform-project/
├── app/
│   ├── index.js
│   └── package.json
├── Dockerfile
├── .github/workflows/deploy.yml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── backend.tf
└── README.md
```

### 🐳 Build & Push Docker Image

```bash
# Build the Docker image
docker build -t my-app .

# Tag the image for ECR
docker tag my-app:latest <your_ecr_repo_uri>:latest

# Log in to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <your_ecr_repo_uri>

# Push the image
docker push <your_ecr_repo_uri>:latest
```

### 🚀 Trigger a New Deployment

1. Go to ECS → Clusters → `my-fargate-cluster` → `my-app-service`
2. Click "Update"
3. Enable "Force new deployment"
4. Click "Update Service"

---

## 🔁 CI/CD with GitHub Actions

Every push to `main` triggers the following:

1. Docker image is built
2. Pushed to ECR
3. ECS service is updated

Workflow defined in `.github/workflows/deploy.yml`.

---

## 🔐 Security Groups

| Component | Port | Source           |
|-----------|------|------------------|
| ALB       | 80   | 0.0.0.0/0        |
| ECS Task  | 80   | ALB Security Group |

---

## 📜 Logs

- ECS Task logs available in **CloudWatch Logs**
- Each app request and ALB health check is logged

---

## 💡 What I Learned

- Real-world VPC and ECS configuration with Terraform
- Debugging target group health checks and container lifecycle
- Automating secure Docker workflows using GitHub Actions
- Thinking like a cloud architect (networks, IAM, services)

---

## 🙌 Built by

**Mathew Cherian**  
Iron Panther DevOps, Mark III 🦾🐾

---

## 🧠 Want to Extend It?

- [ ] Add a custom domain via Route53
- [ ] Add HTTPS using ACM + ALB HTTPS listener
- [ ] Use Terraform modules and workspaces (prod/staging)
- [ ] Tag Docker images with Git commit SHA or semver
- [ ] Add a database (RDS, DynamoDB) and connect from ECS

