#!/bin/bash
RunTraining=yes
################################################################
ContinueIterations=600000

# Language 
Lang=jav
Base_lang=jav1
# directory with the old 'best' training set
bestdata_dir=~/tessdata_best
# tessdata directory for config files 
tessdata_dir=~/tessdata_best
# downloaded directory with language data -
langdata_dir=./langdata
# output directories for this run
train_output_dir=./$Lang-layer_train
eval_output_dir=./$Lang-layer_eval
lstm_output_dir=./$Lang-layer_lstm
trained_output_dir=./$Lang-layer_trained-from-$Base_lang

cat \
$lstm_output_dir/$Lang.training_files.txt \
$train_output_dir/$Lang.layer.training_files.txt \
> $trained_output_dir/$Lang.training_files.txt 

if [ $RunTraining = "yes" ]; then
echo "####  layer training from $bestdata_dir/$Base_lang.traineddata #####"
OMP_THREAD_LIMIT=1  ~/tesseract/src/training/lstmtraining \
--continue_from  $bestdata_dir/$Base_lang.lstm \
--append_index 5 --net_spec '[Lfx192 O1c1]' \
--traineddata   $trained_output_dir/$Lang/$Lang.traineddata \
--max_iterations $ContinueIterations \
--debug_interval -1 \
--train_listfile $trained_output_dir/$Lang.training_files.txt \
--model_output  $trained_output_dir/layer

echo "#### Building final trained file $best_trained_data_file ####"
echo "#### stop training                                       ####"
~/tesseract/src/training/lstmtraining \
--stop_training \
--continue_from  $trained_output_dir/layer_checkpoint \
--traineddata   $trained_output_dir/$Lang/$Lang.traineddata \
--model_output $trained_output_dir/$Lang-layer.traineddata

cp $trained_output_dir/$Lang-layer.traineddata    ~/tessdata_best/

echo -e "\n #### eval files with $train_output_dir/$Lang-layer.traineddata     ####"
~/tesseract/src/training/lstmeval \
--verbosity  0 \
--model $trained_output_dir/$Lang-layer.traineddata \
--eval_listfile $eval_output_dir/$Lang.training_files.txt
fi