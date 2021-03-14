FROM ubuntu:18.04 as base

ENV PROJECT_PATH=/InvoiceNet
ENV TZ=Australia/Melbourne

ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get install -y python3-pip python3.7-dev python3-tk \
    tesseract-ocr poppler-utils libxext-dev libsm-dev libxrender-dev \
    && pip3 install --upgrade pip 

COPY . $PROJECT_PATH

RUN cd $PROJECT_PATH \
    && pip3 install .


WORKDIR /InvoiceNet

