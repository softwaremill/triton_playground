# Environment

The recommended way to setup environemnt is to create Python
virtual environment.
```bash
virtualenv -p python3.10 .venv
```

```bash
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

# Prepare model-repository

First, download the model from `torchhub` and save it as TorchScript and ONNX.
```bash
python3 utils/export.py
```

Next, activate docker conatiner and convert ONNX model to TensorRT.
```bash
docker run --gpus all -it --rm -v $(pwd):/workspace nvcr.io/nvidia/tensorrt:22.04-py3
bash utils/convert_to_tensorrt.sh
exit
```

Move exported models into `model-repository`.
```bash
bash utils/move_models.sh
```

# Run Triton

Activate docker container with Triton server with mounted `model_repository` directory.

```bash
docker run -it --gpus all -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/model_repository:/models --shm-size 1024m --net=host nvcr.io/nvidia/tritonserver:22.04-py3
```

Next, install dependencies and run Triton:

```bash
pip install pillow torch transformers
tritonserver --model-repository=/models
```

# perf_analzyer

With the Triton running in another container run the command below to enter
appropriate container and run `perf_analyzer`:

```bash
docker run -it --gpus all -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/workspace --net=host nvcr.io/nvidia/tritonserver:22.04-py3-sdk
perf_analyzer -m model_torchscript -b 1 --concurrency-range 1:4
```

# model_analzyer

To use the `model-analyzer` shutdown previously started Triton server.
Enter a docker container and run an analysis. All parameters for the
`model-analyzer` are described here:
https://github.com/triton-inference-server/model_analyzer/blob/main/docs/config.md.

```bash
docker run -it --gpus all -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):$(pwd) --shm-size 1024m --net=host nvcr.io/nvidia/tritonserver:22.04-py3-sdk
cd /home/... # go to the same path as You were in your host filesystem
model-analyzer profile --model-repository $(pwd)/model_repository --profile-models model_onnx --triton-launch-mode=docker --output-model-repository-path $(pwd)/output/ -f perf.yaml --override-output-model-repository
```

To generate a report follow instructions from `model-analyzer`.

# Benchmark

To reproduce a benchmark reported in a blogpost run `run_benchmark.sh`
script in a `utils` directory. Use the same configuration as in the
`perf_analyzer` section.
