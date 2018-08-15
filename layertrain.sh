#!/bin/bash
RunTraining=yes
################################################################
ContinueIterations=600000

# Language 
Lang=jav_java
Base_lang=jav1

# directory with the old 'best' training set
bestdata_dir=~/tessdata_best
# tessdata directory for config files 
tessdata_dir=~/tessdata_best
# downloaded directory with language data -
langdata_dir=./langdata

# output directories for this run
train_output_dir=./$Lang-train
eval_output_dir=./$Lang-eval
trained_output_dir=./$Lang-trained
test_output_dir=./$Lang-TEST

if [ $RunTraining = "yes" ]; then
echo "####  layer training from $bestdata_dir/$Base_lang.traineddata #####"
OMP_THREAD_LIMIT=1  lstmtraining \
--continue_from  $bestdata_dir/$Base_lang.lstm \
--append_index 5 --net_spec '[Lfx192 O1c1]' \
--traineddata   $train_output_dir/$Lang/$Lang.traineddata \
--max_iterations $ContinueIterations \
--debug_interval -1 \
--train_listfile $test_output_dir/$Lang.training_files.txt \
--model_output  $trained_output_dir/layer

echo "#### Building final trained file $best_trained_data_file ####"
echo "#### stop training                                       ####"
~/tesseract/src/training/lstmtraining \
--stop_training \
--continue_from  $trained_output_dir/layer_checkpoint \
--traineddata   $train_output_dir/$Lang/$Lang.traineddata \
--model_output $trained_output_dir/$Lang-layer.traineddata

echo -e "\n #### eval files with $train_output_dir/$Lang-layer.traineddata     ####"
OMP_THREAD_LIMIT=1   lstmeval \
--verbosity  0 \
--model $trained_output_dir/$Lang-layer.traineddata \
--eval_listfile $eval_output_dir/$Lang.training_files.txt

echo -e "\n #### TEST files with $train_output_dir/$Lang-layer.traineddata     ####"
OMP_THREAD_LIMIT=1   lstmeval \
--verbosity  0 \
--model $trained_output_dir/$Lang-layer.traineddata \
--eval_listfile $test_output_dir/$Lang.training_files.txt

cp $trained_output_dir/$Lang-layer.traineddata    ~/tessdata_best/

fi