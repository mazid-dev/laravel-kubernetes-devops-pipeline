`# 🚀 Laravel on Kubernetes (kubeadm + Docker + Helm + GitHub Actions)

A production-style end-to-end DevOps project demonstrating deployment of a Laravel 11 application on a self-managed Kubernetes cluster using Docker, Helm, and GitHub Actions CI/CD pipeline.

---

## 📌 Project Overview
This project demonstrates how a Laravel application can be containerized and deployed on a Kubernetes cluster built using **kubeadm** on **AWS EC2**. The deployment is fully automated using **GitHub Actions CI/CD pipeline** and managed through **Helm charts** with Ingress-based external access.

The system is designed as a real-world DevOps workflow including build, push, deploy, monitoring, and troubleshooting.

---

## 🏗️ Architecture
```text
Developer → GitHub → GitHub Actions CI
                         ↓
                 Docker Image Build
                         ↓
                    Docker Hub
                         ↓
                 GitHub Actions CD
                         ↓
                 Helm Deployment
                         ↓
              Kubernetes Cluster (kubeadm)
                         ↓
        ┌────────────────────────────┐
        │ Laravel App (PHP + Nginx)  │
        │ Ingress Controller         │
        └────────────────────────────┘
                         ↓
                 NodePort (30850)
                         ↓
                     Browser User`

---

## ⚙️ Tech Stack

| **Layer** | **Technology** |
| --- | --- |
| **Application** | Laravel 11 (PHP 8.2-FPM, Nginx) |
| **Containerization** | Docker (Multi-stage build) |
| **Orchestration** | Kubernetes (kubeadm v1.30) |
| **Package Manager** | Helm |
| **CI/CD** | GitHub Actions |
| **Cloud** | AWS EC2 (Ubuntu 22.04) |
| **Networking** | Calico CNI, Nginx Ingress |
| **Registry** | Docker Hub |

---

## 🚀 Key Features

- ✅ Fully containerized Laravel application
- ✅ Production-like Kubernetes cluster setup (1 master + 2 workers)
- ✅ Automated CI/CD pipeline with GitHub Actions
- ✅ Helm-based deployment management
- ✅ Ingress controller for external traffic routing
- ✅ Health check endpoint (`/health`)
- ✅ Scalable and modular architecture

---

## 🧱 Project Setup Flow

1. Laravel application setup
2. Docker image creation (multi-stage build)
3. Push image to Docker Hub
4. Kubernetes cluster setup using kubeadm
5. Install Calico CNI & Nginx Ingress Controller
6. Create Helm chart (Deployment, Service, Ingress, ConfigMap)
7. Configure GitHub Actions CI/CD pipeline
8. Deploy application automatically via Helm upgrade
9. Access application via NodePort + Ingress

---

## 🐞 Key Issues & Solutions

| **Issue** | **Cause** | **Solution** |
| --- | --- | --- |
| **Nodes NotReady** | Missing CNI | Installed Calico |
| **Worker Not Joining** | swap enabled | Disabled swap |
| **Ingress error** | webhook issue | Removed invalid webhook config |
| **PVC Pending** | No StorageClass | Disabled persistence |
| **Laravel 500 error** | session DB issue | Set `SESSION_DRIVER=file` |
| **Supervisord error** | wrong path | Fixed executable path |
| **Connection refused** | Security group issue | Opened NodePort 30850 |

---

## ✅ Final Result

- **Pods Status:** Running (1/1)
- **Health Check:** `{"status":"ok"}`
- **Browser Access:** `http://laravel-test.local:30850`
- **CI/CD:** Fully automated deployment on every push

---

## 📸 Screenshots

#### 1. Kubernetes Cluster Status (Nodes Ready)
![Cluster Status](./screenshots/nodes_ready.png)

#### 2. Kubernetes Pods Status
![Pod Status](./screenshots/pod_status.png)

#### 3. Web Browser Access
![Browser Output](./screenshots/browser_output.png)

#### 4. GitHub Actions Pipeline Success
![GitHub Actions](./screenshots/pipeline_success.png)


## 🧠 What I Learned

- Docker multi-stage production builds
- Kubernetes cluster setup with kubeadm
- CNI networking (Calico)
- Helm templating and deployment strategy
- CI/CD automation with GitHub Actions
- Real-world DevOps troubleshooting
- Laravel container optimization

---

## 🔮 Future Improvements

- [ ]  Add MySQL (RDS / StatefulSet)
- [ ]  Enable Persistent Volumes
- [ ]  Implement HPA (Auto Scaling)
- [ ]  Add HTTPS with Cert-Manager
- [ ]  Monitoring with Prometheus & Grafana
- [ ]  Implement GitOps with ArgoCD

---

## 📌 Conclusion

This project represents a real production-grade DevOps workflow, where every code push triggers an automated pipeline that builds, tests, and deploys a Laravel application into a Kubernetes cluster.

**It demonstrates strong hands-on experience in:**

- Cloud Infrastructure
- CI/CD Automation
- Kubernetes Orchestration
- Containerized Application Deployment

## **👨‍💻 Author**

 **Md Mazid Hossain**

Contact: 01739365972