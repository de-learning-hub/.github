# Contributing to DE Learning Hub

Thank you for your interest in contributing to DE Learning Hub! We welcome contributions from the community.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Code Standards](#code-standards)
- [Commit Messages](#commit-messages)
- [Pull Request Process](#pull-request-process)
- [Testing](#testing)

## Code of Conduct

By participating in this project, you agree to:

- Be respectful to other contributors
- Accept constructive criticism gracefully
- Focus on what is best for the community
- Show empathy towards other community members

## Getting Started

### 1. Fork and Clone

```bash
# Fork the repository through GitHub UI
# Then clone your fork:
git clone https://github.com/YOUR_USERNAME/REPO_NAME.git
cd REPO_NAME

# Add upstream remote:
git remote add upstream https://github.com/de-learning-hub/REPO_NAME.git
```

### 2. Environment Setup

**Backend:**
```bash
cd backend
python -m venv venv
source venv/bin/activate  # Linux/macOS
# or: venv\Scripts\activate  # Windows
pip install -r requirements/dev.txt
```

**Frontend:**
```bash
cd frontend
npm install
```

### 3. Create Feature Branch

```bash
git checkout develop
git pull upstream develop
git checkout -b feature/your-feature-name
```

## Development Workflow

### Git Flow

We use the Git Flow branching model:

```
main           - Production-ready code
develop        - Integration branch
feature/*      - New features
bugfix/*       - Bug fixes
hotfix/*       - Critical fixes from main
```

### Branch Naming

```
feature/add-resource-filtering
feature/improve-search-performance
bugfix/fix-pagination-error
bugfix/correct-api-response
hotfix/security-vulnerability-fix
```

## Code Standards

### Python (Backend)

**Style Guide:**
- Use **Ruff** for formatting and linting
- **Type hints** required for all functions
- **Docstrings** in NumPy style (English)
- **Comments** only where necessary (English)

**Example:**
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

**Before Committing:**
```bash
# Formatting
ruff format .

# Linting
ruff check .
ruff check --fix .

# Type checking
mypy .

# Tests
python manage.py test
```

### TypeScript (Frontend)

**Style Guide:**
- ESLint + Prettier for formatting
- TypeScript strict mode enabled
- Functional components with Hooks
- Props interfaces required

**Example:**
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

**Before Committing:**
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

## Commit Messages

We follow [Conventional Commits](https://www.conventionalcommits.org/):

**Format:**
```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Types:**
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation changes
- `style` - Code formatting (no logic changes)
- `refactor` - Code refactoring
- `test` - Adding or updating tests
- `chore` - Dependency updates, configuration changes

**Examples:**
```bash
feat(resources): add filtering by difficulty level
fix(api): correct pagination offset calculation
docs(readme): update installation instructions
test(resources): add unit tests for Resource model
refactor(services): extract business logic to service layer
chore(deps): update Django to 5.1.5
```

**Scope** (optional but recommended):
- Backend: `models`, `views`, `serializers`, `api`, `admin`
- Frontend: `components`, `pages`, `hooks`, `services`, `types`
- Infrastructure: `docker`, `ci`, `deploy`

## Pull Request Process

### 1. Before Creating PR

```bash
# Update develop branch
git checkout develop
git pull upstream develop

# Rebase your feature branch
git checkout feature/your-feature
git rebase develop

# Ensure tests pass
# Backend:
python manage.py test
ruff check .
mypy .

# Frontend:
npm run test
npm run lint
```

### 2. Create Pull Request

**Use this template:**

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

- Wait for review from maintainers
- Address review comments
- Make requested changes
- Maintainer will approve or request additional changes

### 4. After Merge

```bash
# Update your develop branch
git checkout develop
git pull upstream develop

# Delete feature branch
git branch -d feature/your-feature
git push origin --delete feature/your-feature
```

## Testing

### Backend Tests

```bash
# Run all tests
python manage.py test

# Run specific app tests
python manage.py test apps.resources

# With coverage
coverage run --source='.' manage.py test
coverage report
coverage html  # Open htmlcov/index.html
```

**Minimum coverage: 80%**

### Frontend Tests

```bash
# Run all tests
npm run test

# Watch mode
npm run test:watch

# Coverage
npm run test:coverage
```

### Integration Tests

For testing the entire system:

```bash
cd infrastructure
docker-compose -f docker-compose.test.yml up --abort-on-container-exit
```

## Reporting Bugs

**Use GitHub Issues:**

1. Check if the bug has already been reported
2. Create a new issue with:
   - Expected behavior
   - Actual behavior
   - Steps to reproduce
   - Screenshots (if applicable)
   - Environment (OS, browser, versions)

**Example:**

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

## Suggesting Features

**Use GitHub Discussions:**

1. Check existing discussions
2. Create a new discussion in "Ideas" category
3. Describe:
   - Problem the feature solves
   - Proposed solution
   - Alternatives considered
   - Additional context

## Additional Resources

- [CLAUDE.md](https://github.com/de-learning-hub/backend/blob/main/CLAUDE.md) - Detailed development standards
- [Architecture Docs](https://github.com/de-learning-hub/.github/blob/main/docs/architecture.md)
- [API Documentation](http://localhost:8000/api/schema/swagger-ui/)

## Acknowledgments

Thank you to all contributors for helping improve the project!

---

**Questions?** Start a discussion in [GitHub Discussions](https://github.com/orgs/de-learning-hub/discussions)
