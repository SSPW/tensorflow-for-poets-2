py -3.5 -m scripts.retrain --how_many_training_steps=%1 --learning_rate=%2 --output_graph=tf_files/retrained_graph.pb --output_labels=tf_files/retrained_labels.txt --architecture=mobilenet_0.50_224 --image_dir=tf_files/flower_photos --summaries_dir=C:\tmp\retrain_logs