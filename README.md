# Docker LaTeX

## Project Overview
`docker-latex` provides a minimal and efficient Docker image for compiling LaTeX documents. Based on `debian:stable-slim`, it includes essential TeX Live packages and tools required for high-quality document preparation. The image is designed for use in both CI/CD pipelines and local development environments, providing a consistent LaTeX environment without the need for a full local TeX Live installation.

### Key Technologies
- **Docker**: Containerization platform.
- **TeX Live**: The core LaTeX distribution, including `latex-extra`, `fonts-recommended`, `xetex`, and `luatex`.
- **Debian Stable Slim**: The base operating system for a small footprint.
- **GNU Make**: Used for local image management and execution.
- **GitHub Actions**: Automates the build and publication process to GitHub Packages (GHCR).

## Building and Running
The project includes a `Makefile` to simplify common tasks.

### Core Commands
- **Build the image locally**:
  ```bash
  make build
  ```
- **Pull the latest image**:
  ```bash
  make pull
  ```
- **Run the LaTeX compiler**:
  ```bash
  make run
  ```
  *Note: This command mounts the current directory to `/docs` within the container and runs with `--network none` for security.*
- **Push the image to the registry**:
  ```bash
  make push
  ```
- **Remove local images**:
  ```bash
  make clean
  ```

## Development Conventions
- **Minimal Footprint**: The `Dockerfile` is optimized to reduce image size by purging documentation (`texlive-doc`) and cleaning `apt` caches.
- **Security**: The container runs as a non-root user (`latex`) and defaults to no network access during document compilation.
- **CI/CD**: Automated builds are triggered on pushes to the `master` branch via GitHub Actions, publishing to `ghcr.io/uridium/latex`.
- **Standards**: The project follows OpenContainers labeling standards for metadata.
