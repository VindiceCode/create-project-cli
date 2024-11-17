# Project Templates

## Available Templates

1. **Basic Python Package**
```
project/
├── src/
│   └── package_name/
│       ├── __init__.py
│       └── main.py
├── tests/
│   ├── __init__.py
│   └── test_main.py
├── docs/
│   └── README.md
├── requirements.txt
├── setup.py
├── pytest.ini
└── README.md
```

2. **FastAPI Backend**
```
project/
├── app/
│   ├── __init__.py
│   ├── main.py
│   ├── api/
│   │   ├── __init__.py
│   │   ├── v1/
│   │   │   ├── __init__.py
│   │   │   └── endpoints/
│   │   └── deps.py
│   ├── core/
│   │   ├── config.py
│   │   └── security.py
│   ├── db/
│   │   ├── session.py
│   │   └── base.py
│   ├── models/
│   │   └── __init__.py
│   └── schemas/
│       └── __init__.py
├── tests/
├── alembic/
├── alembic.ini
├── requirements.txt
└── README.md
```

3. **Next.js + Python Backend**
```
project/
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── styles/
│   │   └── utils/
│   ├── public/
│   ├── package.json
│   └── next.config.js
├── backend/
│   ├── app/
│   │   ├── api/
│   │   ├── models/
│   │   └── utils/
│   ├── tests/
│   └── requirements.txt
├── docker/
│   ├── frontend.Dockerfile
│   └── backend.Dockerfile
├── docker-compose.yml
└── README.md
```

4. **Data Science Project**
```
project/
├── data/
│   ├── raw/
│   ├── processed/
│   └── external/
├── notebooks/
│   └── exploratory/
├── src/
│   ├── data/
│   │   └── make_dataset.py
│   ├── features/
│   │   └── build_features.py
│   ├── models/
│   │   ├── train_model.py
│   │   └── predict_model.py
│   └── visualization/
│       └── visualize.py
├── requirements.txt
├── setup.py
└── README.md
```

5. **Flask Web Application**
```
project/
├── app/
│   ├── __init__.py
│   ├── routes.py
│   ├── models.py
│   ├── forms.py
│   ├── static/
│   │   ├── css/
│   │   ├── js/
│   │   └── img/
│   └── templates/
├── tests/
├── config.py
├── requirements.txt
└── README.md
```

6. **CLI Tool**
```
project/
├── src/
│   └── cli_tool/
│       ├── __init__.py
│       ├── cli.py
│       ├── commands/
│       └── utils/
├── tests/
├── setup.py
├── requirements.txt
└── README.md
```

7. **Django Project**
```
project/
├── manage.py
├── project_name/
│   ├── __init__.py
│   ├── settings/
│   │   ├── __init__.py
│   │   ├── base.py
│   │   ├── development.py
│   │   └── production.py
│   ├── urls.py
│   └── wsgi.py
├── apps/
│   └── core/
│       ├── __init__.py
│       ├── admin.py
│       ├── models.py
│       ├── views.py
│       └── tests.py
├── static/
├── templates/
├── requirements/
│   ├── base.txt
│   ├── development.txt
│   └── production.txt
└── README.md
```

8. **Machine Learning API**
```
project/
├── api/
│   ├── __init__.py
│   ├── main.py
│   ├── models/
│   │   ├── __init__.py
│   │   └── ml_models.py
│   └── endpoints/
├── ml/
│   ├── training/
│   ├── preprocessing/
│   └── evaluation/
├── data/
│   ├── raw/
│   └── processed/
├── notebooks/
├── tests/
├── requirements.txt
└── README.md
```

## Common Features Across Templates

Each template comes with:
- Comprehensive .gitignore
- Environment setup scripts
- Basic documentation structure
- Testing framework setup
- Development tools configuration
- Docker support (optional)
- CI/CD templates (optional)

## Additional Options

Each template can be customized with:
1. **Testing Framework**
   - pytest (default)
   - unittest
   - nose2

2. **Documentation**
   - Sphinx
   - MkDocs
   - Read the Docs

3. **Development Tools**
   - pre-commit hooks
   - black formatter
   - flake8 linter
   - mypy type checker

4. **CI/CD**
   - GitHub Actions
   - GitLab CI
   - Jenkins pipeline

5. **Containerization**
   - Docker
   - Docker Compose
   - Kubernetes configs

## Usage in Script

To implement these templates in the setup script, add:
```bash
# Template selection
echo "Select project template:"
echo "1) Basic Python Package"
echo "2) FastAPI Backend"
echo "3) Next.js + Python Backend"
echo "4) Data Science Project"
echo "5) Flask Web Application"
echo "6) CLI Tool"
echo "7) Django Project"
echo "8) Machine Learning API"
read -p "$(echo -e ${BLUE}?${NC}) Template number (default: 1): " template_number
template_number=${template_number:-"1"}
```

Would you like me to:
1. Add more specific template details?
2. Create the template implementation code?
3. Add configuration options for each template?
4. Include specific dependency lists for each template?
