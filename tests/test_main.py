from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_health():
    r = client.get("/health")
    assert r.status_code == 200

def test_get_item():
    r = client.get("/items/42")
    assert r.json()["item_id"] == 42

def test_create_item():
    r = client.post("/items?name=test")
    assert r.json()["created"] == True
