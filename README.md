# .github

Organization-wide documentation and resources for DE Learning Hub.

## What is this repository?

This is a special GitHub repository that provides:

- **Organization Profile** (`profile/README.md`) - Displayed on the organization's main page
- **Setup Scripts** (`scripts/`) - Automated setup for all project repositories
- **Contributing Guidelines** (`CONTRIBUTING.md`) - How to contribute to the project
- **Documentation** (`docs/`) - Architecture and development guides

## Quick Start

To set up the entire DE Learning Hub project locally:

```bash
# Download and run the setup script
curl -fsSL https://raw.githubusercontent.com/de-learning-hub/.github/main/scripts/setup-all.sh | bash

# Or clone this repository and run locally:
git clone https://github.com/de-learning-hub/.github.git
cd .github
bash scripts/setup-all.sh
```

## Repository Structure

```
.github/
├── profile/
│   └── README.md          # Organization profile page
├── scripts/
│   └── setup-all.sh       # Automated setup script
├── docs/                  # Additional documentation (future)
├── CONTRIBUTING.md        # Contribution guidelines
└── README.md              # This file
```

## Related Repositories

- [backend](https://github.com/de-learning-hub/backend) - Django REST API
- [frontend](https://github.com/de-learning-hub/frontend) - React application
- [infrastructure](https://github.com/de-learning-hub/infrastructure) - Docker and CI/CD
- [airflow](https://github.com/de-learning-hub/airflow) - ETL pipelines (Phase 2+)

## Documentation

- [Organization Profile](profile/README.md) - Public-facing organization page
- [Contributing Guidelines](CONTRIBUTING.md) - How to contribute
- [Setup Script](scripts/setup-all.sh) - Automated repository setup

## License

[MIT License](LICENSE)
