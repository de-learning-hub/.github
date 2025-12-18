# DE Learning Hub 🚀

> Систематизированная база знаний для русскоязычных дата-инженеров

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![GitHub Organization](https://img.shields.io/badge/GitHub-de--learning--hub-181717?logo=github)](https://github.com/de-learning-hub)

## 📚 О проекте

**DE Learning Hub** — это платформа для агрегации и систематизации образовательных материалов по Data Engineering. Проект помогает:

- 🎓 **Junior Data Engineers** — изучить основы профессии
- 📈 **Middle Data Engineers** — углубить знания в конкретных областях
- 🚀 **Senior Data Engineers** — найти продвинутые материалы
- 🔄 **Career Switchers** — перейти в Data Engineering

## 🗂️ Структура проекта

Проект состоит из нескольких независимых репозиториев:

### 🔧 Core Services

| Репозиторий | Описание | Технологии | Статус |
|-------------|----------|------------|--------|
| [**backend**](https://github.com/de-learning-hub/backend) | REST API для управления контентом | Django, PostgreSQL, DRF | 🚧 Phase 0 |
| [**frontend**](https://github.com/de-learning-hub/frontend) | Веб-интерфейс пользователя | React, TypeScript, Vite | 🚧 Phase 0 |
| [**infrastructure**](https://github.com/de-learning-hub/infrastructure) | Docker, CI/CD, мониторинг | Docker Compose, GitHub Actions | 🚧 Phase 0 |

### 🤖 Data Engineering (Phase 2+)

| Репозиторий | Описание | Технологии | Статус |
|-------------|----------|------------|--------|
| [**airflow**](https://github.com/de-learning-hub/airflow) | ETL пайплайны и парсеры | Airflow, Python | 📋 Planned |

## 🏗️ Архитектура

```
┌─────────────────────────────────────────────────────────┐
│                      Frontend                            │
│                 (React + TypeScript)                     │
└────────────────────────┬────────────────────────────────┘
                         │ REST API
                         ↓
┌─────────────────────────────────────────────────────────┐
│                      Backend                             │
│              (Django REST + PostgreSQL)                  │
└────────────────────────┬────────────────────────────────┘
                         ↑
                         │ Parsed Data
┌─────────────────────────────────────────────────────────┐
│                      Airflow                             │
│           (Habr, YouTube, Telegram parsers)              │
└─────────────────────────────────────────────────────────┘
```

## 🚀 Быстрый старт

### Вариант 1: Автоматический setup (рекомендуется)

```bash
# Скачать и запустить setup script
curl -fsSL https://raw.githubusercontent.com/de-learning-hub/.github/main/scripts/setup-all.sh | bash

# Или клонировать вручную:
git clone https://github.com/de-learning-hub/.github.git
cd .github
bash scripts/setup-all.sh
```

### Вариант 2: Ручная установка

```bash
# Создайте рабочую директорию
mkdir de-learning-hub && cd de-learning-hub

# Клонируйте репозитории
git clone https://github.com/de-learning-hub/backend.git
git clone https://github.com/de-learning-hub/frontend.git
git clone https://github.com/de-learning-hub/infrastructure.git

# Запустите через Docker Compose
cd infrastructure
cp .env.example .env
docker-compose up -d
```

### Доступ к сервисам

После запуска будут доступны:

- 🌐 **Frontend**: http://localhost:3000
- 🔧 **Backend API**: http://localhost:8000
- 📚 **API Docs**: http://localhost:8000/api/schema/swagger-ui/
- ⚙️ **Django Admin**: http://localhost:8000/admin

## 📖 Документация

- 📘 [**Backend README**](https://github.com/de-learning-hub/backend/blob/main/README.md) - Django API setup
- 📗 [**Frontend README**](https://github.com/de-learning-hub/frontend/blob/main/README.md) - React app setup
- 📙 [**Infrastructure README**](https://github.com/de-learning-hub/infrastructure/blob/main/README.md) - Docker & deployment
- 📕 [**CLAUDE.md**](https://github.com/de-learning-hub/backend/blob/main/CLAUDE.md) - Development standards

### Полезные ссылки

- 🎯 [Architecture Overview](https://github.com/de-learning-hub/.github/blob/main/docs/architecture.md)
- 🛠️ [Development Guide](https://github.com/de-learning-hub/.github/blob/main/docs/development.md)
- 🤝 [Contributing Guidelines](https://github.com/de-learning-hub/.github/blob/main/CONTRIBUTING.md)
- 📋 [Project Roadmap](https://github.com/orgs/de-learning-hub/projects)

## 🛠️ Технологический стек

### Backend
- **Language**: Python 3.11+
- **Framework**: Django 5.1+, Django REST Framework
- **Database**: PostgreSQL 15+
- **API Docs**: drf-spectacular (OpenAPI)
- **Code Quality**: Ruff, MyPy

### Frontend
- **Language**: TypeScript
- **Framework**: React 18+
- **Build Tool**: Vite
- **State**: TBD (Redux Toolkit / Zustand)
- **UI**: TBD (Material-UI / Ant Design)

### Infrastructure
- **Containers**: Docker, Docker Compose
- **CI/CD**: GitHub Actions
- **Monitoring**: TBD (Prometheus + Grafana)
- **Secrets**: HashiCorp Vault (production)

### Data Engineering (Phase 2+)
- **Orchestration**: Apache Airflow 3.0
- **Sources**: Habr, YouTube, Telegram, VC.ru, Medium

## 📊 Roadmap

- [x] **Phase 0**: Project setup and architecture ← **ВЫ ЗДЕСЬ**
- [ ] **Phase 1**: MVP with manual content management (2-3 weeks)
- [ ] **Phase 2**: Airflow automation and parsers (3-4 weeks)
- [ ] **Phase 3**: Learning paths and recommendations (2-3 weeks)
- [ ] **Phase 4**: Interview preparation section (2 weeks)
- [ ] **Phase 5**: Deployment and production setup (1-2 weeks)
- [ ] **Phase 6**: Polish and improvements (ongoing)

## 🤝 Участие в проекте

Мы приветствуем контрибьюторов! Вот как можно помочь:

1. 🍴 Fork интересующего репозитория
2. 🌿 Создайте feature branch (`git checkout -b feature/amazing-feature`)
3. 💾 Commit изменения (`git commit -m 'feat: add amazing feature'`)
4. 📤 Push в branch (`git push origin feature/amazing-feature`)
5. 🔀 Откройте Pull Request

### Стандарты разработки

- **Git commits**: [Conventional Commits](https://www.conventionalcommits.org/) (English)
- **Code style**: Ruff для Python, ESLint для TypeScript
- **Type hints**: Обязательны везде
- **Tests**: Минимум 80% покрытия
- **Documentation**: NumPy docstrings (English)

Подробнее в [CONTRIBUTING.md](https://github.com/de-learning-hub/.github/blob/main/CONTRIBUTING.md)

## 🐛 Нашли баг?

Создайте issue в соответствующем репозитории:

- Backend bugs → [backend/issues](https://github.com/de-learning-hub/backend/issues)
- Frontend bugs → [frontend/issues](https://github.com/de-learning-hub/frontend/issues)
- Infrastructure → [infrastructure/issues](https://github.com/de-learning-hub/infrastructure/issues)
- Общие вопросы → [.github/discussions](https://github.com/de-learning-hub/.github/discussions)

## 📞 Контакты

- 💬 [GitHub Discussions](https://github.com/orgs/de-learning-hub/discussions)
- 📧 Email: contact@de-learning-hub.example.com
- 🐦 Twitter: [@de_learning_hub](https://twitter.com/de_learning_hub)
- 💼 LinkedIn: [DE Learning Hub](https://linkedin.com/company/de-learning-hub)

## 📄 Лицензия

Проект распространяется под лицензией [MIT License](LICENSE).

## 🙏 Благодарности

- Команда Django и Django REST Framework
- Сообщество React и TypeScript
- Все контрибьюторы проекта
- Русскоязычное Data Engineering сообщество

---

**Сделано с ❤️ для русскоязычного DE комьюнити**

[![GitHub Stars](https://img.shields.io/github/stars/de-learning-hub?style=social)](https://github.com/de-learning-hub)
[![Follow](https://img.shields.io/github/followers/de-learning-hub?label=Follow&style=social)](https://github.com/de-learning-hub)
