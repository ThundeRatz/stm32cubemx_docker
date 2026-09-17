# syntax=docker/dockerfile:1

FROM ubuntu:24.04 AS stm32cubemx

LABEL org.opencontainers.image.source="https://github.com/ThundeRatz/stm32cubemx_docker"
LABEL org.opencontainers.image.description="STM32CubeMX environment for headless STM32 code generation"

# System libraries used by the Java runtime bundled with STM32CubeMX, plus a virtual display for its GUI
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        fonts-dejavu-core \
        libasound2t64 \
        libgbm1 \
        libgl1 \
        libgtk-3-0t64 \
        libxi6 \
        libxrender1 \
        libxtst6 \
        libxxf86vm1 \
        procps \
        unzip \
        wget \
        xauth \
        xvfb && \
    rm -rf /var/lib/apt/lists/*

ARG CUBE_ARCHIVE=stm32cube_mx_v6181-lin.zip

RUN mkdir /tmp/st && cd /tmp/st && \
    wget -nv "https://sw-center.st.com/packs/resource/library/${CUBE_ARCHIVE}" && \
    unzip -q "${CUBE_ARCHIVE}" && \
    unzip -q JavaJre.zip && \
    mv MX /root/STM32CubeMX && \
    mv jre /root/STM32CubeMX && \
    cd / && rm -rf /tmp/st

ENV CUBE_PATH="/root/STM32CubeMX"

# Run STM32CubeMX once so its first launch setup is part of the image
RUN echo "exit" > /tmp/cube-init && \
    xvfb-run --auto-servernum "${CUBE_PATH}/STM32CubeMX" -q /tmp/cube-init && \
    rm /tmp/cube-init

ARG MCU

# Only the firmware sources are needed by STM32CubeMX, so the git history and example projects are dropped
RUN if [ -z "${MCU}" ]; then \
        echo "Docker built without MCU repository."; \
    else \
        apt-get update && \
        apt-get install -y --no-install-recommends git && \
        mkdir -p /root/STM32Cube/Repository && cd /root/STM32Cube/Repository && \
        git clone --recursive --depth 1 --shallow-submodules "https://github.com/STMicroelectronics/STM32Cube${MCU}.git" && \
        rm -rf "STM32Cube${MCU}/.git" "STM32Cube${MCU}/Projects" && \
        find "STM32Cube${MCU}" -name .git -exec rm -rf {} + && \
        apt-get purge -y --auto-remove git && \
        rm -rf /var/lib/apt/lists/*; \
    fi
