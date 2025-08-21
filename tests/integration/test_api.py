from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)


def test_all_api_endpoints():
    endpoints = [
        "/api/about",
        "/api/skills",
        "/api/projects",
        "/api/education"
    ]

    for endpoint in endpoints:
        response = client.get(endpoint)
        assert response.status_code == 200
        assert isinstance(response.json(), (dict, list))  # should return JSON
