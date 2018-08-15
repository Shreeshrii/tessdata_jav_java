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
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_100.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_10.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_11.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_12.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_13.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_14.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_15.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_16.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_17.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_18.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_19.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_1.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_20.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_21.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_22.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_23.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_24.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_25.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_26.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_27.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_28.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_29.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_2.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_30.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_31.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_32.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_33.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_34.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_35.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_36.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_37.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_38.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_39.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_3.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_40.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_41.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_42.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_43.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_44.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_45.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_46.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_47.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_48.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_49.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_4.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_50.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_51.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_52.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_53.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_54.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_55.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_56.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_57.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_58.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_59.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_5.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_60.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_61.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_62.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_63.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_64.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_65.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_66.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_67.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_68.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_69.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_6.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_70.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_71.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_72.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_73.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_74.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_75.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_76.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_77.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_78.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_79.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_7.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_80.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_81.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_82.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_83.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_84.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_85.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_86.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_87.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_88.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_89.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_8.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_90.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_91.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_92.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_93.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_94.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_95.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_96.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_97.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_98.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_99.txt.aksara.txt' \
  '../javanese-aksara-training-text/result-100-with-whitespace/jav.training_text_9.txt.aksara.txt' \
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