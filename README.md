# Mon App — Pipeline CI/CD DevOps

API REST FastAPI avec pipeline CI/CD complet sur Azure.

## Lancer localement
```bash
pip install -r requirements.txt
uvicorn app.main:app --reload
```

## Lancer les tests
```bash
pytest tests/ --cov=app --cov-report=xml
```

## Endpoints
- GET  /health       → 200 OK
- GET  /items/{id}   → retourne un item
- POST /items?name=  → crée un item
- GET  /metrics      → métriques Prometheus
