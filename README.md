<!-- markdownlint-disale -->
<div align="center">

STM32CubeMX Setup and Docker Environment for STM32 Projects

</div>

<div align="center">
  <a href="https://www.docker.com/"><img alt="Built with Docker" src="https://img.shields.io/badge/built_with-Docker-blue?style=for-the-badge&labelColor=0c74b8&color=43a3c5" height="30"></a>
  <a href="https://www.st.com/en/development-tools/stm32cubemx.html"><img alt="Uses STM32CubeMX" src="https://img.shields.io/badge/uses-stm32cubemx-blue?style=for-the-badge&labelColor=38c1d0&color=45a4b8" height="30"></a>
  <a href="https://ubuntu.com"><img alt="Built on Ubuntu" src="https://img.shields.io/badge/built_on-Ubuntu-blue?style=for-the-badge&labelColor=5d8ab6&color=3f596f" height="30"></a>
</div>
<!-- markdownlint-restore -->

## 📑 Summary

- [📑 Summary](#-summary)
- [🔨 Building](#-building)
- [🚀 Running](#-running)
- [💻 Docker Setup](#-docker-setup)
- [👥 Contributing](#-contributing)
- [✨ Contributors](#-contributors)

## 🚀 Running

To use the `thunderatz/stm32cubemx` image in another container, you can pull it directly from the GitHub Container Registry (GHCR) or Docker Hub.

### 1. Pulling the Image

If you're using **Docker Hub**, use the following command:

```bash
docker pull thunderatz/stm32cubemx:6.13.0
```

If you're using **GHCR**, the command will be:

```bash
docker pull ghcr.io/thunderatz/stm32cubemx:6.13.0
```

### 2. Running the Image

After pulling the image, you can run it in a container with the following command. Make sure to adjust the volume according to your project:

```bash
docker run --rm -it \
  -v /path/to/your/project:/workspace \
  thunderatz/stm32cubemx:6.13.0
```

Or, if you're using **GHCR**:

```bash
docker run --rm -it \
  -v /path/to/your/project:/workspace \
  ghcr.io/thunderatz/stm32cubemx:6.13.0
```

## 🔨 Building

This project uses Docker to containerize the STM32CubeMX environment, making setup and development easier. Follow these steps to set up your environment:

### 1. Build the Docker Image

Make sure Docker is installed on your machine. To build the Docker image, run the following command in the project's root directory:

```bash
docker build -t stm32cubemx -f .
```

This will download and install all necessary dependencies, including STM32CubeMX and Java Runtime.

### 2. Run STM32CubeMX in Docker

Once the image is built, you can run STM32CubeMX inside the Docker container. To do this, execute the following command:

```bash
docker run -it --rm stm32cubemx
```

This will launch the STM32CubeMX environment inside the Docker container, allowing you to work on your STM32 project.

## 💻 Docker Setup

The Dockerfile provided in this repository creates a containerized environment for STM32CubeMX. It includes all the necessary dependencies to run STM32CubeMX on an Ubuntu system. Here's a summary of how the Dockerfile works:

- **Base Image**: The Dockerfile starts from the official Ubuntu 24.04 image.
- **Dependencies**: It installs essential packages such as `unzip`, `xvfb`, `wget`, `openjdk-21-jre`, and others required to run STM32CubeMX.
- **STM32CubeMX**: It downloads and sets up STM32CubeMX, along with the Java Runtime.
- **X11 Virtual Frame Buffer (Xvfb)**: A virtual X server is used to run the GUI-based STM32CubeMX in headless mode.

## 👥 Contributing

We welcome contributions! To contribute to the `ThundeRatz/stm32cubemx` project, please follow these guidelines:

1. **Fork the repository** – Start by forking this repository to your own GitHub account.

2. **Create a new branch** – When creating a new branch for your changes, please name the branch according to the version of STM32CubeMX you are working with. For example:

   - `v6.13.1` for version 6.13.1 of STM32CubeMX
   - `v6.14.0` for version 6.14.0 of STM32CubeMX

3. **Make your changes** – Implement the desired changes or fixes in your branch.

4. **Test your changes** – Ensure everything works as expected within the container. Build and verify the setup for STM32CubeMX.

5. **Submit a pull request** – Once your changes are ready, submit a pull request (PR) with a detailed description of the modifications.

We appreciate all contributions, whether it's reporting issues, suggesting features, or submitting fixes!

## ✨ Contributors

Thanks goes to these wonderful people:

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/Eduardo-Barreto"><img src="https://avatars.githubusercontent.com/u/34964398?v=4" width="100px;" alt="Eduardo Barreto"/><br/><sub><b>Eduardo Barreto</b></sub></a><br/><a href="https://github.com/ThundeRatz/stm32cubemx_docker/commits?author=Eduardo-Barreto" title="Code">💻</a> <a href="https://github.com/ThundeRatz/stm32cubemx_docker/commits?author=Eduardo-Barreto" title="Documentation">📖</a>  <a href="#research-Eduardo-Barreto" title="Research">🔬</a> <a href="https://github.com/ThundeRatz/stm32cubemx_docker/pulls?q=is%3Apr+reviewed-by%3AEduardo-Barreto" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/GabrielCosme"><img src="https://avatars.githubusercontent.com/u/62270066?v=4?s=100" width="100px;" alt="Gabriel Cosme Barbosa"/><br/><sub><b>Gabriel Cosme Barbosa</b></sub></a><br/><a href="https://github.com/ThundeRatz/stm32cubemx_docker/commits?author=GabrielCosme" title="Code">💻</a> <a href="#research-GabrielCosme" title="Research">🔬</a> <a href="https://github.com/ThundeRatz/stm32cubemx_docker/pulls?q=is%3Apr+reviewed-by%3AGabrielCosme" title="Reviewed Pull Requests">👀</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of all kinds are welcome!
