# wuhulamb's wiki

Personal knowledge base built with [MkDocs](https://www.mkdocs.org/) and the [Material](https://squidfunk.github.io/mkdocs-material/) theme, deployed to GitHub Pages.

## Prerequisites

- Python >= 3.12
- [uv](https://docs.astral.sh/uv/) (recommended) or pip

## Quick Start

```bash
# Create virtual environment and install dependencies
uv sync

# Start local dev server with hot-reload
uv run mkdocs serve

# Build static site to ./site/
uv run mkdocs build
```

The dev server runs at `http://127.0.0.1:8000` by default.

## Project Structure

```
.
├── docs/                        # Markdown source files
│   ├── index.md                 # Home page
│   ├── bookmarks.md
│   ├── bash/
│   │   ├── common.md
│   │   ├── git.md
│   │   └── pdf.md
│   ├── links/
│   │   ├── cs.md
│   │   └── tools.md
│   ├── network/
│   │   ├── proxy.md
│   │   └── wireshark.md
│   ├── prompt/
│   │   └── literature.md
│   └── video/
│       ├── ffmpeg.md
│       └── m3u8.md
├── mkdocs.yml                   # MkDocs configuration
├── pyproject.toml               # Python project config (uv)
└── .github/workflows/ci.yaml    # CI/CD pipeline
```

## Adding Content

1. Create a Markdown file in the appropriate `docs/` subdirectory
2. Add the page to the `nav` section in `mkdocs.yml`
3. Run `uv run mkdocs serve` to preview locally

## Deployment

Deployment is handled by [`.github/workflows/ci.yaml`](.github/workflows/ci.yaml). Pushing to the `main` branch triggers it automatically:

1. **Build** — sets up Python, installs `mkdocs` and `mkdocs-material`, runs `mkdocs build`
2. **Deploy** — uploads the generated `./site/` directory to GitHub Pages

The site is published at [https://wuhulamb.github.io/wiki/](https://wuhulamb.github.io/wiki/).

Deployment uses the modern [actions/deploy-pages](https://github.com/actions/deploy-pages) approach — no `gh-pages` branch required.
