#!/bin/bash

docker build -t bevformer_${1} .

# docker run -it --rm \
#         --gpus all \
#         -v /tmp/.X11-unix:/tmp/.X11-unix \
#         -v /data:/data \
#         -v ./:/workspace/EasyCV \
#         --shm-size=32g \
#         --privileged \
#         --network=host \
#         --name easycv_${1} \
#         easycv_${1}