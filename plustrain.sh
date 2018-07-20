#!/bin/bash

RunTraining=no
ContinueTraining=yes
################################################################
MaxIterations=300
ContinueIterations=100000

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
trained_output_dir=./$Lang-plus_trained-from-$Continue_from_lang

shuf -o $train_output_dir/$Lang.training_files.txt <$train_output_dir/$Lang.training_files.txt

if [ $RunTraining = "yes" ]; then

echo "#### plus training from $bestdata_dir/$Continue_from_lang.traineddata #####"

lstmtraining \
--continue_from  $bestdata_dir/$Continue_from_lang.lstm \
--old_traineddata  $bestdata_dir/$Continue_from_lang.traineddata \
--traineddata   $trained_output_dir/$Lang/$Lang.traineddata \
--max_iterations $MaxIterations \
--debug_interval -1 \
--train_listfile $train_output_dir/$Lang.training_files.txt \
--model_output  $trained_output_dir/plus

fi

if [ $ContinueTraining = "yes" ]; then

echo "####  plus training from $bestdata_dir/$Continue_from_lang.traineddata #####"

lstmtraining \
--continue_from  $trained_output_dir/plus_checkpoint \
--traineddata   $trained_output_dir/$Lang/$Lang.traineddata \
--max_iterations $ContinueIterations \
--debug_interval -1 \
--train_listfile $train_output_dir/$Lang.training_files.txt \
--model_output  $trained_output_dir/plus

echo "#### Building final trained file $best_trained_data_file ####"
echo "#### stop training                                       ####"
lstmtraining \
--stop_training \
--continue_from $trained_output_dir/plus_checkpoint \
--traineddata   $train_output_dir/$Lang/$Lang.traineddata \
--model_output $trained_output_dir/$Lang-plus-float.traineddata

cp $trained_output_dir/$Lang-plus-float.traineddata    ../tessdata_best/

echo -e "\n #### eval files with $train_output_dir/$Lang-plus-float.traineddata     ####"
lstmeval \
--verbosity  0 \
--model $trained_output_dir/$Lang-plus-float.traineddata \
--eval_listfile $eval_output_dir/$Lang.training_files.txt

fi

