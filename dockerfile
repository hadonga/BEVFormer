FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-devel
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

# set working directory 
RUN mkdir -p /workspace/bevformer
WORKDIR /workspace/bevformer

# set userinfo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install denpendies
RUN apt-get update && apt-get install -y fish
RUN pip install torch==1.8.1+cu111 torchvision==0.9.1+cu111 torchaudio==0.8.1 -f https://download.pytorch.org/whl/torch_stable.html

# install mmlab 
RUN pip install mmcv-full==1.3.8
RUN pip install mmdet==2.14.0
RUN pip install mmsegmentation==0.14.1
RUN git clone https://github.com/openmmlab/mmdetection3d 
WORKDIR ./mmdetection3d
RUN git checkout v0.17.1
RUN pip install -e .


RUN pip install nuscenes-devkit shapely==1.8.4 timm==0.5.4





# RUN pip install mmcv-full==1.7.1 -f https://download.openmmlab.com/mmcv/dist/cu116/torch1.13/index.html
# RUN pip install mmdet==2.14.0
# RUN pip install mmsegmentation==0.14.1
# RUN pip install mmdetection3d 
# # RUN pip install https://developer.download.nvidia.com/compute/redist/nvidia-dali-cuda100/nvidia_dali_cuda100-0.25.0-1535750-py3-none-manylinux2014_x86_64.whl


# RUN pip install einops fvcore seaborn iopath==0.1.9 timm==0.6.13  typing-extensions==4.5.0 pylint ipython==8.12  numpy==1.19.5 matplotlib==3.5.2 numba==0.48.0 pandas==1.4.4 scikit-image==0.19.3 setuptools==59.5.0
# RUN python -m pip install 'git+https://github.com/facebookresearch/detectron2.git'

# # Install onnx and pai_nni
# RUN pip install onnx
# RUN pip install https://pai-nni.oss-cn-zhangjiakou.aliyuncs.com/release/2.5/pai_nni-2.5-py3-none-manylinux1_x86_64.whl

# # install blade_compression
# RUN pip install http://pai-vision-data-hz.oss-cn-zhangjiakou.aliyuncs.com/third_party/blade_compression-0.0.1-py3-none-any.whl