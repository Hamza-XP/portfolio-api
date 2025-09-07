about = {
    "name": "Hamza Qureshi",
    "title": "DevOps Engineer",
    "location": "Lahore, Punjab, Pakistan",
    "email": "ih20gt@gmail.com",
    "github": "https://github.com/Hamza-XP",
    "linkedin": "https://www.linkedin.com/in/hamza-xp",
    "bio": "DevOps engineer specializing in automation, cloud infrastructure, and CI/CD pipelines. Experienced in delivering production-ready systems with Docker, AWS, and modern deployment practices. Passionate about helping businesses automate, scale, and secure their operations."
}

skills = {
    "devops_cloud": [
        "Docker", "Docker Compose", "Terraform", "Ansible",
        "Kubernetes (basic)", "CI/CD (GitHub Actions)",
        "Linux (Ubuntu/Debian)", "Git", "AWS EC2", "AWS S3"
    ],
    "scripting_automation": [
        "Python", "Bash", "Shell scripting"
    ],
    "ml_projects": [
        "TensorFlow", "OpenCV", "YOLOv5", "Roboflow", "REST APIs"
    ],
    "other_tools": [
        "GitHub", "GitLab", "Jenkins", "VS Code", "GCP (basics)"
    ]
}

# skills = {
#     "devops_cloud": ["Docker", "Docker Compose", "Terraform", "Ansible", "Kubernetes (basic)", "CI/CD (GitHub Actions)", "Linux (Ubuntu/Debian)", "Git", "AWS EC2", "AWS S3"],
#     "ml_vision": ["TensorFlow", "OpenCV", "YOLOv5", "Roboflow", "REST APIs"],
#     "scripting": ["Python", "Bash", "Zsh", "Shell scripting"],
#     # "embedded_systems": ["Arduino", "C/C++", "NASM Assembly", "PlatformIO"],
#     "networking_telecom": ["TCP/IP", "SIP (basic)", "SMPP (basic)", "VoIP"],
#     "other_tools": ["GitHub", "GitLab", "Jenkins", "VS Code", "DOSBox", "GCP (basics)"]
# }

projects = [
    {
        "name": "SecureVision-Proxy",
        "url": "https://github.com/devop-collab/SecureVision-Proxy",
        "technologies": ["Docker", "TensorFlow", "Nginx", "OpenCV", "GitHub Actions", "Prometheus"],
        "description": "Weapon detection system that leverages TensorFlow Deep Neural Networks to provide real-time threat identification in CCTV footage and static images. Architected with DevOps practices, deployment on AWS EC2 with comprehensive monitoring, caching, and security hardening."
    },
    {
        "name": "ansible-ec2-wordpress",
        "url": "https://github.com/Hamza-XP/ansible-ec2-wordpress",
        "technologies": ["Ansible", "Terraform", "WordPress", "WooCommerce", "Nginx", "PHP 8.1", "MySQL", "AWS EC2", "Certbot SSL", "GitHub Actions"],
        "description": "Automated Wordpress WooCommerce store deployment using Ansible and Terraform. Provisions AWS EC2, sets up Nginx, PHP 8.1, MySQL, and configures HTTPS via Certbot SSL. Includes UFW, Fail2ban, SSH key authentication, idempotent modular playbooks, and GitHub Actions CI/CD."
    },
    {
        "name": "portfolio-api",
        "url": "https://github.com/Hamza-XP/portfolio-api",
        "technologies": ["Docker", "Terraform", "FastAPI", "AWS EC2", "ACM SSL", "Nginx", "GitHub Actions"],
        "description": "Portfolio built with FastAPI, containerized with Docker, reverse proxied using Nginx, and deployed to AWS EC2 with Application Load Balancer with ACM-managed SSL certificates. Provisioned with Terraform and CI/CD automated via GitHub Actions."
    },
    {
        "name": "TideSync: Autonomous Boat",
        "url": "https://github.com/Hamza-XP/TideSync",
        "technologies": ["Arduino", "Raspberry Pi", "GPS", "Ultrasonic Sensors"],
        "description": "Built an embedded boat navigation system using GPS and obstacle detection, coded in C++ for real-time control."
    },
    {
        "name": "terraform-s3-secure",
        "url": "https://github.com/Hamza-XP/terraform-s3-secure",
        "technologies": ["Terraform", "AWS S3", "CloudFront", "Bash", "GitHub Actions"],
        "description": "Static Website Infrastructure on AWS S3 using Terraform, includes CloudFront for global content delivery, AWS WAF for threat protection, real-time monitoring, automated CI/CD,"
    }
]

education = [
    {
        "degree": "Bachelor of Science in Computer Science",
        "institution": "Information Technology University (ITU), Punjab",
        "year": "2027 (Expected)",
        "semester": "5th"
    },
    {
        "degree": "A-Levels & O-Levels",
        "institution": "Beaconhouse College Program JT",
        "year": "Completed"
    }
]

certifications = [
    {
        "name": "CI/CD with GitHub Actions (Project Experience)",
        "description": "Implemented pipelines across major projects with Docker, testing, and automated deployment workflows."
    },
    {
        "name": "DevOps Deployment (Self-Directed)",
        "description": "Proficient in containerized deployments using Docker and GitHub Actions to AWS EC2 with reverse proxy setup."
    },
    {
        "name": "Telecom Protocol Learning (Independent)",
        "description": "Explored SIP, SMPP, and VoIP technologies through lab simulations and documentation."
    }
]
