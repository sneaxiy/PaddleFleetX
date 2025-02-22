#! /bin/bash

# Copyright (c) 2022 PaddlePaddle Authors. All Rights Reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


export CUDA_VISIBLE_DEVICES="0,1,2,3,4,5,6,7"

python -m paddle.distributed.launch \
  --gpus="0,1,2,3,4,5,6,7" \
  tools/train.py \
  -c ppfleetx/configs/multimodal/clip/clip_vit-b-32.yaml -o Distributed.dp_degree=8 -o Data.Train.loader.num_workers=0 -o Engine.num_train_epochs=68
