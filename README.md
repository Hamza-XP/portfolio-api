# 🚀 Portfolio API Deployment (FastAPI + Docker + CI/CD + AWS EC2)

A production-ready portfolio backend built with **FastAPI**, containerized with **Docker**, reverse proxied using **Nginx**, and deployed to **AWS EC2** with **HTTPS via Certbot SSL**. Includes automated CI/CD pipeline using **GitHub Actions**.

[![Docker](https://img.shields.io/badge/Docker-20.10%2B-blue?logo=docker)](https://docker.com)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.103%2B-green?logo=fastapi)](https://fastapi.tiangolo.com)
[![AWS](https://img.shields.io/badge/AWS-EC2-orange?logo=amazon-aws)](https://aws.amazon.com)

---

## 📌 Core Features

- ⚙️ **FastAPI Backend** - Modern Python API with automatic docs
- 📦 **Dockerized Architecture** - Production-ready containerization
- 🔁 **Nginx Reverse Proxy** - Efficient request routing and SSL termination
- 🔒 **Auto-renewing SSL** - Certbot with Let's Encrypt integration
- 🔄 **CI/CD Pipeline** - GitHub Actions for automated deployments
- ☁️ **Cloud-Optimized** - Ready for AWS EC2 deployment
- 🌐 **Free Domain** - DuckDNS custom domain support

---

## 🧱 Technology Stack

| Layer            | Technology               | Version       |
|------------------|--------------------------|---------------|
| API Framework    | FastAPI                  | 0.103+        |
| Web Server       | Nginx                    | 1.25+         |
| SSL Certificates | Certbot                  | 2.7+          |
| Containerization | Docker                   | 20.10+        |
| Orchestration    | Docker Compose           | 2.20+         |
| Cloud Platform   | AWS EC2                  | Ubuntu 22.04  |
| CI/CD            | GitHub Actions           | -             |
| Domain           | DuckDNS                  | -             |

---

## 📂 Project Structure

```bash
portfolio-api-deploy/
├── app/
│   ├── main.py             # FastAPI application entrypoint
│   └── data.py             # Sample data models
├── nginx/
│   ├── default.conf        # Nginx reverse proxy configuration
│   └── html/               # Static assets directory
│       └── .keep           # Placeholder for Git tracking
├── .github/
│   └── workflows/
│       └── deploy.yml      # CI/CD pipeline configuration
├── docker-compose.yml      # Multi-container orchestration
├── Dockerfile              # FastAPI Docker image
├── requirements.txt        # Python dependencies
└── README.md               # Project documentation
