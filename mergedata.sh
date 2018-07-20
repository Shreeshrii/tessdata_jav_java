#!/bin/bash

MergeData=yes

# Language 
Lang=jav_java
Continue_from_lang=jav1

# directory with the old 'best' training set
bestdata_dir=./tessdata_best
# tessdata directory for config files 
tessdata_dir=./tessdata_best

# downloaded directory with language data -
langdata_dir=./langdata

# output directories for this run
train_output_dir=./$Lang-layer_train
eval_output_dir=./$Lang-layer_eval
trained_output_dir=./$Lang-layer_trained-from-$Continue_from_lang
plus_output_dir=./$Lang-plus_trained-from-$Continue_from_lang

if [ $MergeData = "yes" ]; then


echo "#### combine_tessdata to extract lstm model from 'tessdata_best' for $Continue_from_lang ####"

combine_tessdata -u $bestdata_dir/$Continue_from_lang.traineddata $bestdata_dir/$Continue_from_lang.
combine_tessdata -u $tessdata_dir/$Lang.traineddata $tessdata_dir/$Lang.

echo "#### build version string ####"
Version_Str="$Lang:layer`date +%Y%m%d`:from:"
sed -e "s/^/$Version_Str/" $bestdata_dir/$Continue_from_lang.version > $train_output_dir/$Lang.new.version

echo "#### merge unicharsets to ensure all existing chars are included ####"

merge_unicharsets \
$langdata_dir/Javanese.unicharset \
$train_output_dir/$Lang.orig.unicharset \
$eval_output_dir/$Lang/$Lang.unicharset \
$train_output_dir/$Lang.continue.unicharset

rm -rf $trained_output_dir
mkdir -p  $trained_output_dir

rm -rf $plus_output_dir
mkdir -p  $plus_output_dir

echo "#### rebuild starter traineddata ####"

combine_lang_model \
--input_unicharset $train_output_dir/$Lang.continue.unicharset  \
--script_dir $langdata_dir \
--words $langdata_dir/$Lang/$Lang.wordlist \
--numbers $langdata_dir/$Lang/$Lang.numbers \
--puncs $langdata_dir/$Lang/$Lang.punc \
--output_dir $trained_output_dir \
--pass_through_recoder  \
--lang $Lang \
--version_str ` cat $train_output_dir/$Lang.new.version`

combine_lang_model \
--input_unicharset $train_output_dir/$Lang.continue.unicharset  \
--script_dir $langdata_dir \
--words $langdata_dir/$Lang/$Lang.wordlist \
--numbers $langdata_dir/$Lang/$Lang.numbers \
--puncs $langdata_dir/$Lang/$Lang.punc \
--output_dir $plus_output_dir \
--pass_through_recoder  \
--lang $Lang \
--version_str ` cat $train_output_dir/$Lang.new.version`

fi

