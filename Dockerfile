FROM pytorch/pytorch:2.2.1-cuda11.8-cudnn8-runtime

# Install Whisper
WORKDIR /usr/src
#ARG WHISPER_VERSION='1.0.1'

RUN apt-get update 
RUN pip3 install "wyoming-faster-whisper" 

WORKDIR /
COPY run.sh ./

EXPOSE 10300

ENTRYPOINT ["bash", "/run.sh"]
