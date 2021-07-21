#!/bin/bash

INPUT_DIRECTORY="midi"

# TFRecord file that will contain NoteSequence protocol buffers.
SEQUENCES_TFRECORD="train.tfrecord"

convert_dir_to_note_sequences \
  --input_dir=$INPUT_DIRECTORY \
  --output_file=$SEQUENCES_TFRECORD \
  --recursive

TFRECORDS="./" t2t_datagen \
  --data_dir=datadir \
  --problem=score2perf_maestro_language_uncropped_aug \
  --alsologtostderr

rm *.tfrecord