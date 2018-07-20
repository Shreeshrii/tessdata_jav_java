#!/bin/bash
# variables to set tasks performed
MakeTraining=yes
################################################################
MaxIterations=30000

# Language 
Lang=jav_java
Continue_from_lang=jav1

# directory with the old 'best' training set
#bestdata_dir=../tessdata_best/script
bestdata_dir=../tessdata_best
# tessdata directory for config files 
tessdata_dir=../tessdata

# local directory with language data -
langdata_dir=./langdata

# fonts directory for this system
fonts_dir=../.fonts

# fonts to use for training - a minimal set for fast tests
fonts_for_training=" \
  'Carakan Anyar' \
  'Carakan-Unicode' \
  'Javanese Text' \
  'Prada' \
  'Tuladha Jejeg' \
  "
 
# output directories for this run
train_output_dir=./$Lang-layer_train
eval_output_dir=./$Lang-layer_eval
trained_output_dir=./$Lang-layer_trained-from-$Continue_from_lang

# fatal bug workaround for pango
#export PANGOCAIRO_BACKEND=fc 

if [ $MakeTraining = "yes" ]; then

echo "###### MAKING TRAINING DATA ######"
 rm -rf $train_output_dir
  mkdir $train_output_dir

  # directory with training scripts - tesstrain.sh etc. - local
tesstrain_dir=./tesseract-training

echo "#### run tesstrain.sh ####"

# the EVAL handles the quotes in the font list

eval   bash $tesstrain_dir/tesstrain.sh \
--lang $Lang \
--linedata_only \
--noextract_font_properties \
--exposures "-2 -1 0 1 2" \
--fonts_dir $fonts_dir \
--fontlist $fonts_for_training \
--langdata_dir $langdata_dir \
--tessdata_dir  $tessdata_dir \
--training_text $langdata_dir/$Lang/$Lang.layer.training_text \
--output_dir $train_output_dir

cp     $train_output_dir/$Lang/$Lang.unicharset \
$train_output_dir/$Lang.orig.unicharset 

fi

