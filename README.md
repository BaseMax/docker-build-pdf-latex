# Docker LaTeX Builder

A simple, portable Docker-based environment for building LaTeX documents, articles, papers, books, and presentations.

This project provides:

* A reproducible LaTeX build environment using **texlive/texlive**
* Support for **multiple output formats** (`pdf`, `dvi`, `ps`, `slides`, `beamer`, etc.)
* Ability to **specify which .tex file to compile**
* Simple **docker run** and **docker compose** usage
* Zero installation of TeX Live on your system

---

## Features

* Compile any `.tex` file using Docker
* Fully isolated environment (no need for LaTeX locally)
* Supports:

  * PDF articles
  * DVI output
  * PS output
  * Beamer presentations
  * Slide PDFs
  * Clean mode to delete temp files

---

## Docker Image

When published to Docker Hub, users will be able to pull:

```bash
docker pull basemax/latex-builder:latest
```

(Replace with your actual Docker Hub namespace.)

---

# Quick Start

Compile a LaTeX file inside the current directory:

```bash
docker run --rm \
  -v $(pwd):/work \
  -e TEX_FILE=backend-assignment.tex \
  -e BUILD_FORMAT=pdf \
  basemax/latex-builder
```

Finish output appears inside `./backend-assignment.pdf`.

---

# Build Formats

| Format | Description                   |
| ------ | ----------------------------- |
| pdf    | Build standard PDF            |
| dvi    | Produce .dvi output           |
| ps     | Generate PostScript (.ps)     |
| slides | Build slides (PDF output)     |
| beamer | Build beamer presentation PDF |
| clean  | Remove LaTeX auxiliary files  |

---

# Supported Environment Variables

| Variable       | Default        | Example    | Description                 |
| -------------- | -------------- | ---------- | --------------------------- |
| `TEX_FILE`     | `document.tex` | `main.tex` | Name of TeX file to compile |
| `BUILD_FORMAT` | `pdf`          | `slides`   | Output format               |

---

# Examples

### 1. Build a PDF

```bash
docker run --rm \
  -v $(pwd):/work \
  -e TEX_FILE=main.tex \
  -e BUILD_FORMAT=pdf \
  basemax/latex-builder
```

### 2. Build Beamer slides

```bash
docker run --rm \
  -v $(pwd):/work \
  -e TEX_FILE=presentation.tex \
  -e BUILD_FORMAT=beamer \
  basemax/latex-builder
```

### 3. Build DVI

```bash
docker run --rm \
  -v $(pwd):/work \
  -e TEX_FILE=math-paper.tex \
  -e BUILD_FORMAT=dvi \
  basemax/latex-builder
```

### 4. Clean temporary files

```bash
docker run --rm \
  -v $(pwd):/work \
  -e TEX_FILE=main.tex \
  -e BUILD_FORMAT=clean \
  basemax/latex-builder
```

---

# Using Docker Compose

```yaml
services:
  latex-builder:
    build:
      context: .
      args:
        TEX_FILE: backend-assignment.tex
        BUILD_FORMAT: pdf
    container_name: latex-builder
    volumes:
      - ./:/work
    environment:
      TEX_FILE: backend-assignment.tex
      BUILD_FORMAT: pdf
```

Run:

```bash
docker compose run latex-builder
```

Override on-the-fly:

```bash
TEX_FILE=slides.tex BUILD_FORMAT=beamer docker compose run latex-builder
```

---

# Development

Build image locally:

```bash
docker build -t basemax/latex-builder .
```

Test run:

```bash
docker run --rm -v $(pwd):/work basemax/latex-builder
```

---

# Publishing to Docker Hub

Edit the tag:

```bash
docker tag basemax/latex-builder basemax/latex-builder:latest
```

Push:

```bash
docker push basemax/latex-builder:latest
```

---

# License

MIT License

Copyright © 2025 **Seyyed Ali Mohammadiyeh (Max Base)**
