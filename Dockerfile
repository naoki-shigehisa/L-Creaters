FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04
WORKDIR /usr/src/app
COPY requirements.txt /usr/src/app/

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y libopencv-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt update && apt -y upgrade \
    && apt install -y ffmpeg \
    && apt install -y python3 python3-pip

RUN pip3 install --upgrade pip && \
    pip install -r requirements.txt 