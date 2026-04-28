#!/bin/bash

# 1. Setup paths
PROJECT_DIR="/scratch/subspace-clustering"
ENV_PYTHON="/home/shk/miniconda/envs/weather-env/bin/python"
LOG_OUT="$PROJECT_DIR/mnist_run.log"
LOG_ERR="$PROJECT_DIR/mnist_error.log"

cd "$PROJECT_DIR"

# 2. Set hardware limits
export OMP_NUM_THREADS=8
export PYTHONUNBUFFERED=1

echo "--- Starting Job at $(date) ---" >> "$LOG_OUT"

# 3. Run using the DIRECT path to the env python
# This avoids all 'source' and 'conda activate' headaches
"$ENV_PYTHON" -u run_mnist.py >> "$LOG_OUT" 2>> "$LOG_ERR"

echo "--- Job Finished at $(date) ---" >> "$LOG_OUT"
