#!/bin/bash

trtexec --onnx=model.onnx \
        --saveEngine=model.plan \
        --explicitBatch

trtexec --onnx=model.onnx \
        --saveEngine=model_fp16.plan \
        --explicitBatch \
        --inputIOFormats=fp16:chw \
        --outputIOFormats=fp16:chw \
        --fp16 \
        --minShapes=input:1x3x224x224 \
        --maxShapes=input:8x3x224x224 \
        --optShapes=input:4x3x224x224

# for real scenario You need to provide calibration file
trtexec --onnx=model.onnx \
        --saveEngine=model_int8.plan \
        --explicitBatch \
        --inputIOFormats=int8:chw \
        --outputIOFormats=int8:chw \
        --int8 \
        --fp16 \
        --minShapes=input:1x3x224x224 \
        --maxShapes=input:8x3x224x224 \
        --optShapes=input:4x3x224x224

trtexec --onnx=model.onnx \
        --saveEngine=model_dynamic_batch_size.plan \
        --explicitBatch \
        --minShapes=input:1x3x224x224 \
        --maxShapes=input:8x3x224x224 \
        --optShapes=input:4x3x224x224
        