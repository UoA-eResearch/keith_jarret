#!/bin/bash

DATA_DIR=datadir
HPARAMS_SET=transformer_tpu
MODEL=transformer
PROBLEM=score2perf_maestro_language_uncropped_aug
TRAIN_DIR=models

HPARAMS=\
"label_smoothing=0.0,"\
"max_length=0,"\
"max_target_seq_length=2048,"\
"num_hidden_layers=16"

t2t_trainer \
  --data_dir="${DATA_DIR}" \
  --hparams=${HPARAMS} \
  --hparams_set=${HPARAMS_SET} \
  --model=${MODEL} \
  --warm_start_from=models/unconditional_model_16.ckpt \
  --output_dir=${TRAIN_DIR} \
  --problem=${PROBLEM} \
  --train_steps=1000000