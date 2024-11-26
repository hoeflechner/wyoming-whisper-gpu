FROM nvidia/cuda:11.8.0-base-ubuntu22.04

# Install Whisper
WORKDIR /usr/src
#ARG WHISPER_VERSION='1.0.1'

RUN apt-get update 
RUN apt-get install -y --no-install-recommends \
        build-essential \
        python3 \
        python3-dev \
        python3-pip \
        python-is-python3 
RUN pip install setuptools wheel 
RUN pip install torch
RUN pip install wyoming-faster-whisper 

WORKDIR /
COPY run.sh ./

EXPOSE 10300

ENTRYPOINT ["bash", "/run.sh"]
