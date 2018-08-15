#!/bin/bash
################################################
MakeTraining=yes
################################################################
# Language 
Lang=jav_java
# directory with the old 'best' training set
bestdata_dir=../tessdata_best
# tessdata directory for config files 
tessdata_dir=../tessdata
# local directory with language data -
langdata_dir=./langdata
# fonts directory for this system
fonts_dir=../.fonts
# fonts to use for training 
fonts_for_training=" \
  'Prada' \
  "
texts_for_training=" \
  '../javanese-aksara-training-text/jav.training_text_01.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_02.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_03.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_04.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_05.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_06.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_07.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_08.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_09.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_10.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_11.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_12.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_13.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_14.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_15.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_16.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_17.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_18.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_19.aksara.txt' \
  '../javanese-aksara-training-text/jav.training_text_20.aksara.txt' \
  '../bible_javanese_aksara/1.aksara.txt' \
  '../bible_javanese_aksara/2.aksara.txt' \
  '../bible_javanese_aksara/3.aksara.txt' \
  '../bible_javanese_aksara/4.aksara.txt' \
  '../bible_javanese_aksara/5.aksara.txt' \
  '../bible_javanese_aksara/6.aksara.txt' \
  '../bible_javanese_aksara/7.aksara.txt' \
  '../bible_javanese_aksara/8.aksara.txt' \
  '../bible_javanese_aksara/9.aksara.txt' \
  '../bible_javanese_aksara/10.aksara.txt' \
  '../bible_javanese_aksara/11.aksara.txt' \
  '../bible_javanese_aksara/12.aksara.txt' \
  '../bible_javanese_aksara/13.aksara.txt' \
  '../bible_javanese_aksara/14.aksara.txt' \
  '../bible_javanese_aksara/15.aksara.txt' \
  '../bible_javanese_aksara/16.aksara.txt' \
  '../bible_javanese_aksara/17.aksara.txt' \
  '../bible_javanese_aksara/18.aksara.txt' \
  '../bible_javanese_aksara/19.aksara.txt' \
  '../bible_javanese_aksara/20.aksara.txt' \
  './langdata/jav_java/jav_java.OLD.training_text' \
"
# output directories for this run
train_output_dir=./$Lang-train
# directory with training scripts - tesstrain.sh etc. - local
tesstrain_dir=./tesseract-training
# workspacedir
work_dir=../tmp/$Lang-train
rm -rf $work_dir
mkdir $work_dir

if [ $MakeTraining = "yes" ]; then
echo "###### MAKING TRAINING DATA ######"
rm -rf $train_output_dir
mkdir $train_output_dir

echo "#### run tesstrain.sh ####"
# the EVAL handles the quotes in the font list
eval   bash -x $tesstrain_dir/tesstrain.sh \
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