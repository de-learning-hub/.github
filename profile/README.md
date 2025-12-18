# DE Learning Hub

> Curated knowledge base and learning platform for Data Engineers

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![GitHub Organization](https://img.shields.io/badge/GitHub-de--learning--hub-181717?logo=github)](https://github.com/de-learning-hub)

## About the Project

**DE Learning Hub** is a platform for aggregating, organizing, and discovering educational materials for Data Engineering professionals. The platform provides:

- Curated resources for all skill levels (Junior, Middle, Senior)
- Structured learning paths and roadmaps
- Interview preparation materials
- Community-driven content recommendations
- Multi-language support (English, Russian)

## Project Structure

The project uses a multi-repository architecture with independent services:

### Core Services

| Repository | Description | Technologies | Status |
|------------|-------------|--------------|--------|
| [**backend**](https://github.com/de-learning-hub/backend) | REST API and content management | Django, PostgreSQL, DRF | Phase 0 |
| [**frontend**](https://github.com/de-learning-hub/frontend) | Web application interface | React, TypeScript, Vite | Phase 0 |
| [**infrastructure**](https://github.com/de-learning-hub/infrastructure) | Docker, CI/CD, deployment | Docker Compose, GitHub Actions | Phase 0 |

### Data Engineering (Phase 2+)

| Repository | Description | Technologies | Status |
|------------|-------------|--------------|--------|
| [**airflow**](https://github.com/de-learning-hub/airflow) | ETL pipelines and content parsers | Apache Airflow, Python | Planned |

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                      Frontend                            │
│                 (React + TypeScript)                     │
└────────────────────────┬────────────────────────────────┘
                         │ REST API / JSON
                         ↓
┌─────────────────────────────────────────────────────────┐
│                      Backend                             │
│              (Django REST + PostgreSQL)                  │
└────────────────────────┬────────────────────────────────┘
                         ↑
                         │ Automated Content Ingestion
┌─────────────────────────────────────────────────────────┐
│                      Airflow                             │
│       (Parsers: Medium, YouTube, Telegram, etc.)         │
└─────────────────────────────────────────────────────────┘
```

## Quick Start

### Automated Setup (Recommended)

```bash
# Download and execute setup script
curl -fsSL https://raw.githubusercontent.com/de-learning-hub/.github/main/scripts/setup-all.sh | bash

# Or clone the repository:
git clone https://github.com/de-learning-hub/.github.git
cd .github
bash scripts/setup-all.sh
```

### Manual Installation

```bash
# Create project directory
mkdir de-learning-hub && cd de-learning-hub

# Clone repositories
git clone https://github.com/de-learning-hub/backend.git
git clone https://github.com/de-learning-hub/frontend.git
git clone https://github.com/de-learning-hub/infrastructure.git

# Start services with Docker Compose
cd infrastructure
cp .env.example .env
# Edit .env with your configuration
docker-compose up -d
```

### Service Access

After starting the services:

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8000
- **API Documentation**: http://localhost:8000/api/schema/swagger-ui/
- **Django Admin**: http://localhost:8000/admin

## Documentation

### Repository Documentation
- [Backend README](https://github.com/de-learning-hub/backend/blob/main/README.md) - Django API setup and configuration
- [Frontend README](https://github.com/de-learning-hub/frontend/blob/main/README.md) - React application setup
- [Infrastructure README](https://github.com/de-learning-hub/infrastructure/blob/main/README.md) - Docker and deployment
- [CLAUDE.md](https://github.com/de-learning-hub/backend/blob/main/CLAUDE.md) - Development standards and guidelines

### Additional Resources
- [Architecture Overview](https://github.com/de-learning-hub/.github/blob/main/docs/architecture.md)
- [Development Guide](https://github.com/de-learning-hub/.github/blob/main/docs/development.md)
- [Contributing Guidelines](https://github.com/de-learning-hub/.github/blob/main/CONTRIBUTING.md)
- [Project Roadmap](https://github.com/orgs/de-learning-hub/projects)

## Technology Stack

### Backend
- **Language**: Python 3.11+
- **Framework**: Django 5.1+, Django REST Framework
- **Database**: PostgreSQL 15+
- **API Documentation**: drf-spectacular (OpenAPI 3.0)
- **Code Quality**: Ruff, MyPy

### Frontend
- **Language**: TypeScript
- **Framework**: React 18+
- **Build Tool**: Vite
- **State Management**: TBD (Redux Toolkit / Zustand)
- **UI Framework**: TBD (Material-UI / Ant Design)

### Infrastructure
- **Containers**: Docker, Docker Compose
- **CI/CD**: GitHub Actions
- **Monitoring**: TBD (Prometheus + Grafana)
- **Secrets Management**: HashiCorp Vault (production)

### Data Engineering (Phase 2+)
- **Orchestration**: Apache Airflow 3.0
- **Content Sources**: Medium, YouTube, Telegram, Habr, VC.ru

## Development Roadmap

- [x] **Phase 0**: Project setup and architecture
- [ ] **Phase 1**: MVP with manual content management
- [ ] **Phase 2**: Airflow automation and content parsers
- [ ] **Phase 3**: Learning paths and personalized recommendations
- [ ] **Phase 4**: Interview preparation section
- [ ] **Phase 5**: Production deployment and CI/CD
- [ ] **Phase 6**: Continuous improvements and scaling

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Standards

- **Commit Messages**: [Conventional Commits](https://www.conventionalcommits.org/)
- **Code Style**: Ruff (Python), ESLint (TypeScript)
- **Type Safety**: Type hints required for all functions
- **Testing**: Minimum 80% code coverage
- **Documentation**: NumPy-style docstrings

See [CONTRIBUTING.md](https://github.com/de-learning-hub/.github/blob/main/CONTRIBUTING.md) for detailed guidelines.

## Issues and Support

Report issues in the appropriate repository:

- Backend: [backend/issues](https://github.com/de-learning-hub/backend/issues)
- Frontend: [frontend/issues](https://github.com/de-learning-hub/frontend/issues)
- Infrastructure: [infrastructure/issues](https://github.com/de-learning-hub/infrastructure/issues)
- General discussions: [.github/discussions](https://github.com/de-learning-hub/.github/discussions)

## Contact

- GitHub Discussions: [de-learning-hub/discussions](https://github.com/orgs/de-learning-hub/discussions)
- Email: contact@de-learning-hub.example.com
- Twitter: [@de_learning_hub](https://twitter.com/de_learning_hub)
- LinkedIn: [DE Learning Hub](https://linkedin.com/company/de-learning-hub)

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- Django and Django REST Framework team
- React and TypeScript community
- Data Engineering community
- All project contributors

---

[![GitHub Stars](https://img.shields.io/github/stars/de-learning-hub?style=social)](https://github.com/de-learning-hub)
[![Follow](https://img.shields.io/github/followers/de-learning-hub?label=Follow&style=social)](https://github.com/de-learning-hub)
