FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

ENV PYTHONBUFFERD 1

RUN mkdir /workspace

WORKDIR /workspace

COPY requirements.txt /workspace/

RUN apt-get update && apt-get install -y libopencv-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y install ffmpeg libavcodec-extra

RUN apt update && apt -y upgrade \
    && apt install -y python3 python3-pip

RUN pip3 install --upgrade pip && \
    pip install -r requirements.txt 