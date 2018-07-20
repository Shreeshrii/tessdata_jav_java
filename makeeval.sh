#!/bin/bash

MakeEval=yes

# Language 
Lang=jav_java
Continue_from_lang=jav1

# directory with the old 'best' training set
bestdata_dir=../tessdata_best
# tessdata directory for config files 
tessdata_dir=../tessdata

# downloaded directory with language data -
langdata_dir=./langdata

# fonts directory for this system
fonts_dir=../.fonts

# fonts for computing evals of best fit model
fonts_for_eval=" \
  'Carakan Anyar' \
  'Carakan-Unicode' \
  'Javanese Text' \
  'Tuladha Jejeg' \
  'Prada' \
  "
 
# output directories for this run
train_output_dir=./$Lang-layer_train
eval_output_dir=./$Lang-layer_eval
trained_output_dir=./$Lang-layer_trained-from-$Continue_from_lang


if [ $MakeEval = "yes" ]; then

echo "###### MAKING EVAL DATA ######"
 rm -rf $eval_output_dir
  mkdir $eval_output_dir
  
# directory with training scripts - tesstrain.sh etc. -local
tesstrain_dir=./tesseract-training

eval   bash $tesstrain_dir/tesstrain.sh \
--fonts_dir $fonts_dir \
--fontlist $fonts_for_eval \
--exposures "0" \
--lang $Lang \
--linedata_only \
--noextract_font_properties \
--langdata_dir $langdata_dir \
--tessdata_dir  $tessdata_dir \
--training_text $langdata_dir/$Lang/$Lang.test.training_text \
--output_dir $eval_output_dir

fi

