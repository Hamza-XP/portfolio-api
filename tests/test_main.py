from fastapi.testclient import TestClient
from app.main import app
from app import data

client = TestClient(app)


def test_root_page_loads():
    response = client.get("/")
    assert response.status_code == 200
    # HTML template should contain at least "Portfolio" keyword
    assert "Portfolio" in response.text


def test_get_about():
    response = client.get("/api/about")
    assert response.status_code == 200
    assert response.json() == data.about


def test_get_skills():
    response = client.get("/api/skills")
    assert response.status_code == 200
    assert response.json() == data.skills


def test_get_projects():
    response = client.get("/api/projects")
    assert response.status_code == 200
    assert response.json() == data.projects


def test_get_education():
    response = client.get("/api/education")
    assert response.status_code == 200
    assert response.json() == data.education
