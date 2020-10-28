@echo off
cls
for /f "delims=" %%a in ('getdatetime') do (@set dt=%%a)
set outfolder=results\%1_%2_%3_%dt%
mkdir %outfolder%
echo output folder is %outfolder%
timeout 3
rem pause
start tb
@echo on

python -m scripts.retrain ^
  --image_dir=tf_files\%1 ^
  --how_many_training_steps=%2 ^
  --learning_rate="0.%3" ^
  --output_graph=%outfolder%\graph.pb ^
  --output_labels=%outfolder%\labels.txt ^
  --architecture=mobilenet_1.0_224 ^
  --intermediate_store_frequency=1000 ^
  --testing_percentage=10 ^
  --validation_percentage=10 ^
  --eval_step_interval=100 ^
  --train_batch_size=100 ^
  --test_batch_size=-1 ^
  --validation_batch_size=100 ^
  --print_misclassified_test_images ^
>> %outfolder%\log.txt

