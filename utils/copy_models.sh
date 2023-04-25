#!/bin/bash

cp model.pt model_repository/model_torchscript/1/model.pt
cp model.onnx model_repository/model_onnx/1/model.onnx
cp model.plan model_repository/model_tensorrt/1/model.plan
cp model.plan model_repository/model_tensorrt_optimized/1/model.plan
cp model_fp16.plan model_repository/model_tensorrt_fp16/1/model.plan
cp model_int8.plan model_repository/model_tensorrt_int8/1/model.plan
cp model_dynamic_batch_size.plan model_repository/model_tensorrt_dynamic_batch/1/model.plan
