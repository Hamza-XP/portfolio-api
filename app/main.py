from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from data import about, skills, projects, education, certifications

app = FastAPI(
    title="Hamza Qureshi - Portfolio",
    description="Dockerized FastAPI portfolio deployed on AWS EC2 with Nginx reverse proxy, contains HTTPS via Certbot and CI/CD using GitHub Actions",
    version="2.0.0"
)

app.mount("/static", StaticFiles(directory="static"), name="static")
templates = Jinja2Templates(directory="templates")

@app.get("/", response_class=HTMLResponse)
async def index(request: Request):
    return templates.TemplateResponse("index.html", {
        "request": request,
        "about": about,
        "skills": skills,
        "projects": projects,
        "education": education,
        # "certifications": certifications
    })

# Optional API routes for data (if you still want endpoints)
@app.get("/api/about")
async def get_about(): return about

@app.get("/api/skills")
async def get_skills(): return skills

@app.get("/api/projects")
async def get_projects(): return projects

@app.get("/api/education")
async def get_education(): return education

# @app.get("/api/certifications")
# async def get_certifications(): return certifications
