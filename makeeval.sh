#!/bin/bash
MakeEval=yes
# Language 
Lang=jav_java
EText=eval
Baselang=jav1
# directory with the old 'best' training set
bestdata_dir=../tessdata_best
# tessdata directory for config files 
tessdata_dir=../tessdata
# downloaded directory with language data -
langdata_dir=./langdata
# directory with training scripts - tesstrain.sh etc. 
tesstrain_dir=./tesseract-training
# workspacedir
work_dir=./tmp
# fonts directory for this system
fonts_dir=../.fonts
# fonts for computing evals of best fit model
fonts_for_eval=" \
  'Prada' \
  "
# output directories for this run
eval_output_dir=./$Lang-$EText
if [ $MakeEval = "yes" ]; then
echo "###### MAKING EVAL DATA ######"
rm -rf $eval_output_dir
mkdir $eval_output_dir

OMP_THREAD_LIMIT=1   eval   bash $tesstrain_dir/tesstrain.sh \
--fonts_dir $fonts_dir \
--fontlist $fonts_for_eval \
--exposures "0" \
--lang $Lang \
--linedata_only \
--noextract_font_properties \
--langdata_dir $langdata_dir \
--tessdata_dir  $tessdata_dir \
--workspace_dir $work_dir \
--training_text $langdata_dir/$Lang/$Lang.$EText.training_text \
--output_dir $eval_output_dir

fi