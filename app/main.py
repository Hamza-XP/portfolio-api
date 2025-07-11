from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from data import about, skills, projects, education, certifications

app = FastAPI(
    title="Hamza Qureshi - Portfolio API",
    description="Dockerized FastAPI portfolio with CI/CD, deployed on AWS EC2 with Nginx & SSL.",
    version="1.0.0"
)

# Allow CORS for frontend if needed
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/api/hello")
def hello():
    return {"message": "Welcome to Hamza Qureshi's Portfolio API 🎯"}

@app.get("/api/about")
def get_about():
    return about

@app.get("/api/skills")
def get_skills():
    return skills

@app.get("/api/projects")
def get_projects():
    return projects

@app.get("/api/education")
def get_education():
    return education

@app.get("/api/certifications")
def get_certifications():
    return certifications
