#!/usr/bin/env bash

################################################
## This file sets up the SCITAS cluster       ##
## to work for our needs with Tensorflow      ##
## The set up was used to train and evaluate  ##
## twitter BERT models                        ##
################################################

set -e

module purge
module load gcc
module load python
module load cuda
module load cudnn
module load mvapich2
module load py-tensorflow

## To create a Conda environment (should be done only once)
# conda create --name ada python=3.7 -y
# conda activate ada
# conda clean -ay
# conda install pip -y
# python -m pip install --upgrade pip
# pip install tensorflow_hub tensorflow_estimator==2.3.0 astunparse numpy gast keras_preprocessing scipy pytz importlib-metadata sentencepiece jupyter pyarrow tensorboard tqdm termcolor decorator mpi4py jupyter google_pasta opt_einsum wrapt pandas dask[complete] sklearn --prefix="$CONDA_PREFIX"

conda activate ada
cd /scratch/izar/rajic/ada

# Test if we have GPUs
python -c 'import tensorflow as tf; print("Num GPUs Available: ", len(tf.config.list_physical_devices("GPU")))'

# Test if all needed modules can be loaded
python -c 'import numpy as np; import pandas as pd; import tensorflow as tf; from tensorflow.keras.layers import Dense, Input; from tensorflow.keras.optimizers import Adam; from tensorflow.keras.models import Model; from tensorflow.keras.callbacks import ModelCheckpoint; import tensorflow_hub as hub; import dask; import dask.array as da; import dask.bag as db; import dask.dataframe as dd;'

## If you want to start jupter, do it
# jupyter notebook --no-browser --port=8080

set +e
