FROM ubuntu:24.04 AS stm32cubemx

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    unzip \
    xvfb \
    wget \
    openjdk-21-jre \
    libgbm1 \
    && apt-get clean

RUN mkdir st && cd st && \
    wget -nv https://sw-center.st.com/packs/resource/library/stm32cube_mx_v6130-lin.zip && \
    unzip -q stm32cube_mx_v6130-lin.zip && \
    unzip -q JavaJre.zip && \
    mv MX /root/STM32CubeMX && \
    mv jre /root/STM32CubeMX && \
    cd .. && rm -rf st

ENV CUBE_PATH="/root/STM32CubeMX"

RUN echo "exit" > /root/cube-init && \
    Xvfb :10 -ac > /dev/null & \
    export DISPLAY=:10 && \
    $CUBE_PATH/STM32CubeMX -q /root/cube-init && \
    rm /root/cube-init && \
    pkill -f Xvfb


RUN rm /tmp/.X10-lock

ARG MCU

RUN if [ -z "$MCU" ]; then \
        echo "Docker built without MCU repository."; \
    else \
        apt-get install -y git && \
        mkdir -p /root/STM32Cube/Repository && cd /root/STM32Cube/Repository && \
        git clone https://github.com/STMicroelectronics/STM32Cube${MCU}.git && \
        cd STM32Cube${MCU} && \
        git submodule update --init --recursive; \
    fi
