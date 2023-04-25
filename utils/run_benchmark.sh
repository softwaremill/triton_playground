#!/bin/bash

echo "perf_analyzer -m model_torchscript -b 1 --concurrency-range 1:4"
perf_analyzer -m model_torchscript -b 1 --concurrency-range 1:4
echo "perf_analyzer -m model_tensorrt -b 1 --concurrency-range 1:4"
perf_analyzer -m model_tensorrt -b 1 --concurrency-range 1:4
echo "perf_analyzer -m model_tensorrt_dynamic_batch -b 1 --concurrency-range 1:4"
perf_analyzer -m model_tensorrt_dynamic_batch -b 1 --concurrency-range 1:4
echo "perf_analyzer -m model_tensorrt_fp16 -b 1 --concurrency-range 1:4"
perf_analyzer -m model_tensorrt_fp16 -b 1 --concurrency-range 1:4
echo "perf_analyzer -m model_tensorrt_fp16_optimized -b 1 --concurrency-range 1:4"
perf_analyzer -m model_tensorrt_fp16_optimized -b 1 --concurrency-range 1:4
echo "perf_analyzer -m model_tensorrt_int8 -b 1 --concurrency-range 1:4"
perf_analyzer -m model_tensorrt_int8 -b 1 --concurrency-range 1:4

echo "perf_analyzer -m model_torchscript -b 2 --concurrency-range 1:4"
perf_analyzer -m model_torchscript -b 2 --concurrency-range 1:4
echo "perf_analyzer -m model_tensorrt -b 2 --concurrency-range 1:4"
perf_analyzer -m model_tensorrt -b 2 --concurrency-range 1:4
echo "perf_analyzer -m model_tensorrt_dynamic_batch -b 2 --concurrency-range 1:4"
perf_analyzer -m model_tensorrt_dynamic_batch -b 2 --concurrency-range 1:4
echo "perf_analyzer -m model_tensorrt_fp16 -b 2 --concurrency-range 1:4"
perf_analyzer -m model_tensorrt_fp16 -b 2 --concurrency-range 1:4
echo "perf_analyzer -m model_tensorrt_fp16_optimized -b 2 --concurrency-range 1:4"
perf_analyzer -m model_tensorrt_fp16_optimized -b 2 --concurrency-range 1:4
echo "perf_analyzer -m model_tensorrt_int8 -b 2 --concurrency-range 1:4"
perf_analyzer -m model_tensorrt_int8 -b 2 --concurrency-range 1:4

echo "perf_analyzer -m model_onnx_optimized -b 1 --concurrency-range 1:4"
perf_analyzer -m model_onnx_optimized -b 1 --concurrency-range 1:4
echo "perf_analyzer -m model_onnx_optimized -b 2 --concurrency-range 1:4"
perf_analyzer -m model_onnx_optimized -b 2 --concurrency-range 1:4

echo "perf_analyzer perf_analyzer -m python_vit -b 1 --concurrency-range 1:4 --input-data img.json --shape image:640,480,3"
perf_analyzer perf_analyzer -m python_vit -b 1 --concurrency-range 1:4 --input-data img.json --shape image:640,480,3
echo "perf_analyzer perf_analyzer -m python_vit -b 2 --concurrency-range 1:4 --input-data img.json --shape image:640,480,3"
perf_analyzer perf_analyzer -m python_vit -b 2 --concurrency-range 1:4 --input-data img.json --shape image:640,480,3

echo "perf_analyzer perf_analyzer -m ensemble_model -b 1 --concurrency-range 1:4 --input-data img.json --shape image:640,480,3"
perf_analyzer perf_analyzer -m ensemble_model -b 1 --concurrency-range 1:4 --input-data img.json --shape image:640,480,3