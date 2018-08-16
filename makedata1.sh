#!/bin/bash
################################################
MakeTraining=yes
################################################################
# Language 
Lang=jav_java
# directory with the old 'best' training set
bestdata_dir=./tessdata_best
# tessdata directory for config files 
tessdata_dir=./tessdata_best
# local directory with language data -
langdata_dir=./langdata

# fonts directory for this system
fonts_dir=../.fonts
# fonts to use for training 
fonts_for_training=" \
  'Prada' \
  "
texts_for_training=" \
  './langdata/jav_java/jav_java.layer.training_text ' \
  "
 
# output directories for this run
train_output_dir=./$Lang-train
# directory with training scripts - tesstrain.sh etc. - local
tesstrain_dir=./tesseract-training
# workspacedir
work_dir=../tmp

if [ $MakeTraining = "yes" ]; then
echo "###### MAKING TRAINING DATA ######"
rm -rf $train_output_dir
mkdir $train_output_dir

echo "#### run tesstrain.sh ####"
# the EVAL handles the quotes in the font list
eval   bash  $tesstrain_dir/tesstrain.sh \
--lang $Lang \
--linedata_only \
--noextract_font_properties \
--exposures "0" \
--fonts_dir $fonts_dir \
--fontlist $fonts_for_training \
--langdata_dir $langdata_dir \
--tessdata_dir  $tessdata_dir \
--workspace_dir $work_dir \
--output_dir $train_output_dir \
--textlist $texts_for_training 

fi