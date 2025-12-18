# Contributing to DE Learning Hub

Спасибо за интерес к проекту! Мы рады любому вкладу в развитие платформы.

## 📋 Содержание

- [Code of Conduct](#code-of-conduct)
- [Как начать](#как-начать)
- [Процесс разработки](#процесс-разработки)
- [Стандарты кода](#стандарты-кода)
- [Commit Messages](#commit-messages)
- [Pull Request Process](#pull-request-process)
- [Тестирование](#тестирование)

## 🤝 Code of Conduct

Участвуя в проекте, вы соглашаетесь следовать нашим правилам:

- Быть уважительным к другим участникам
- Принимать конструктивную критику
- Фокусироваться на том, что лучше для сообщества
- Проявлять эмпатию к другим участникам

## 🚀 Как начать

### 1. Fork и клонирование

```bash
# Fork репозитория через GitHub UI
# Затем клонируйте свой fork:
git clone https://github.com/YOUR_USERNAME/REPO_NAME.git
cd REPO_NAME

# Добавьте upstream remote:
git remote add upstream https://github.com/de-learning-hub/REPO_NAME.git
```

### 2. Настройка окружения

**Backend:**
```bash
cd backend
python -m venv venv
source venv/bin/activate  # Linux/macOS
pip install -r requirements/dev.txt
```

**Frontend:**
```bash
cd frontend
npm install
```

### 3. Создайте feature branch

```bash
git checkout develop
git pull upstream develop
git checkout -b feature/your-feature-name
```

## 🔄 Процесс разработки

### Git Flow

Мы используем Git Flow branching model:

```
main           - Production-ready код
develop        - Integration branch
feature/*      - Новые фичи
bugfix/*       - Исправления багов
hotfix/*       - Критичные фиксы для production
```

### Naming Conventions

**Branches:**
```
feature/add-resource-filtering
feature/improve-search-performance
bugfix/fix-pagination-error
bugfix/correct-api-response
hotfix/security-vulnerability-fix
```

**Commits:** (см. секцию Commit Messages ниже)

## 📝 Стандарты кода

### Python (Backend)

**Style Guide:**
- Используйте **Ruff** для форматирования и линтинга
- **Type hints** обязательны для всех функций
- **Docstrings** в NumPy style (английский)
- **Комментарии** только где необходимо (английский)

**Пример:**
```python
from typing import List, Optional

def get_resources_by_category(
    category_id: int,
    limit: Optional[int] = None
) -> List[Resource]:
    """Get resources filtered by category.

    Parameters
    ----------
    category_id : int
        ID of the category to filter by
    limit : Optional[int], default None
        Maximum number of resources to return

    Returns
    -------
    List[Resource]
        List of Resource objects

    Raises
    ------
    CategoryNotFound
        If category with given ID doesn't exist
    """
    # Implementation
    pass
```

**Перед коммитом:**
```bash
# Форматирование
ruff format .

# Линтинг
ruff check .
ruff check --fix .

# Type checking
mypy .

# Tests
python manage.py test
```

### TypeScript (Frontend)

**Style Guide:**
- ESLint + Prettier для форматирования
- TypeScript strict mode
- Functional components + Hooks
- Props interfaces обязательны

**Пример:**
```typescript
interface ResourceCardProps {
  resource: Resource;
  onSelect?: (id: number) => void;
}

export const ResourceCard: React.FC<ResourceCardProps> = ({
  resource,
  onSelect
}) => {
  // Implementation
};
```

**Перед коммитом:**
```bash
npm run lint
npm run type-check
npm run test
```

### Naming Conventions

- **Variables/Functions**: `snake_case` (Python), `camelCase` (TypeScript)
- **Classes**: `PascalCase`
- **Constants**: `UPPER_SNAKE_CASE`
- **Private members**: `_leading_underscore`
- **Files**: `kebab-case.ts`, `snake_case.py`

## 💬 Commit Messages

Мы используем [Conventional Commits](https://www.conventionalcommits.org/):

**Format:**
```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Types:**
- `feat` - Новая функциональность
- `fix` - Исправление бага
- `docs` - Изменения в документации
- `style` - Форматирование кода (не влияет на логику)
- `refactor` - Рефакторинг кода
- `test` - Добавление или изменение тестов
- `chore` - Обновление зависимостей, настройка окружения

**Examples:**
```bash
feat(resources): add filtering by difficulty level
fix(api): correct pagination offset calculation
docs(readme): update installation instructions
test(resources): add unit tests for Resource model
refactor(services): extract business logic to service layer
chore(deps): update Django to 5.1.5
```

**Scope** (опционально, но рекомендуется):
- Backend: `models`, `views`, `serializers`, `api`, `admin`
- Frontend: `components`, `pages`, `hooks`, `services`, `types`
- Infrastructure: `docker`, `ci`, `deploy`

## 🔀 Pull Request Process

### 1. Перед созданием PR

```bash
# Обновите develop branch
git checkout develop
git pull upstream develop

# Rebase вашу feature branch
git checkout feature/your-feature
git rebase develop

# Убедитесь что тесты проходят
# Backend:
python manage.py test
ruff check .
mypy .

# Frontend:
npm run test
npm run lint
```

### 2. Создание PR

**Используйте шаблон:**

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update

## Related Issues
Fixes #123
Related to #456

## Testing
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Manual testing completed
- [ ] New tests added for new functionality

## Screenshots (if applicable)
![screenshot](url)

## Checklist
- [ ] Code follows project style guidelines (Ruff, ESLint)
- [ ] Self-review completed
- [ ] Comments added for complex logic
- [ ] Documentation updated (if needed)
- [ ] No new warnings generated
- [ ] All tests pass
- [ ] Type hints added (Python) / Types defined (TypeScript)
```

### 3. Code Review

- Ожидайте review от maintainers
- Отвечайте на комментарии
- Вносите изменения при необходимости
- Maintainer может запросить изменения или одобрить PR

### 4. После merge

```bash
# Обновите свой develop
git checkout develop
git pull upstream develop

# Удалите feature branch
git branch -d feature/your-feature
git push origin --delete feature/your-feature
```

## 🧪 Тестирование

### Backend Tests

```bash
# Все тесты
python manage.py test

# Конкретное приложение
python manage.py test apps.resources

# С покрытием
coverage run --source='.' manage.py test
coverage report
coverage html  # Открыть htmlcov/index.html
```

**Минимальное покрытие: 80%**

### Frontend Tests

```bash
# Все тесты
npm run test

# Watch mode
npm run test:watch

# Coverage
npm run test:coverage
```

### Integration Tests

Для тестирования всей системы:

```bash
cd infrastructure
docker-compose -f docker-compose.test.yml up --abort-on-container-exit
```

## 🐛 Reporting Bugs

**Используйте GitHub Issues:**

1. Проверьте, что баг еще не был зарепорчен
2. Создайте новый issue с описанием:
   - Ожидаемое поведение
   - Актуальное поведение
   - Шаги для воспроизведения
   - Скриншоты (если применимо)
   - Окружение (OS, browser, versions)

**Пример:**

```markdown
**Description:**
Search returns incorrect results when filtering by difficulty

**Expected behavior:**
Should return only resources with "beginner" difficulty

**Actual behavior:**
Returns mixed difficulty levels

**Steps to reproduce:**
1. Go to /resources
2. Select "Beginner" filter
3. Observe results include "Advanced" resources

**Environment:**
- Browser: Chrome 120
- OS: Windows 11
- Backend version: v0.1.0
```

## ✨ Suggesting Features

**Используйте GitHub Discussions:**

1. Проверьте existing discussions
2. Создайте новую discussion в категории "Ideas"
3. Опишите:
   - Проблему, которую решает фича
   - Предлагаемое решение
   - Альтернативы
   - Дополнительный контекст

## 📚 Дополнительные ресурсы

- [CLAUDE.md](https://github.com/de-learning-hub/backend/blob/main/CLAUDE.md) - Детальные стандарты разработки
- [Architecture Docs](https://github.com/de-learning-hub/.github/blob/main/docs/architecture.md)
- [API Documentation](http://localhost:8000/api/schema/swagger-ui/)

## 🙏 Благодарности

Спасибо всем контрибьюторам за помощь в развитии проекта!

---

**Вопросы?** Создайте discussion в [GitHub Discussions](https://github.com/orgs/de-learning-hub/discussions)
