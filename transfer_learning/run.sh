#!/bin/bash

# train
echo "start training"

# superblue11_a
python train.py \
    --task congestion_transfer_learning \
    --save_path ./models/student_model/superblue11_a/ \
    --pretrained ./models/pretrained/congestion_gpdl/model_iters_170000.pth \
    --max_iters 200 \
    --data_root ./data/target_dataset/superblue11_a/ \
    --ann_file_train ./data/target_dataset/superblue11_a.csv \
    --dataset_type SuperBlueDataset
if [ $? -eq 0 ]; then
    echo "superblue11_a done"
else
    echo "superblue11_a failed"
fi

# superblue14
python train.py \
    --task congestion_transfer_learning \
    --save_path ./models/student_model/superblue14/ \
    --pretrained ./models/pretrained/congestion_gpdl/model_iters_170000.pth \
    --max_iters 200 \
    --data_root ./data/target_dataset/superblue14/  \
    --ann_file_train ./data/target_dataset/superblue14.csv  \
    --dataset_type SuperBlueDataset
if [ $? -eq 0 ]; then
    echo "superblue14 done"
else
    echo "superblue14 failed"
fi

# superblue16_a
python train.py \
    --task congestion_transfer_learning \
    --save_path ./models/student_model/superblue16_a/ \
    --pretrained ./models/pretrained/congestion_gpdl/model_iters_170000.pth \
    --max_iters 200 \
    --data_root ./data/target_dataset/superblue16_a/  \
    --ann_file_train ./data/target_dataset/superblue16_a.csv  \
    --dataset_type SuperBlueDataset
if [ $? -eq 0 ]; then
    echo "superblue16_a done"
else
    echo "superblue16_a failed"
fi

# superblue19
python train.py \
    --task congestion_transfer_learning \
    --save_path ./models/student_model/superblue19/ \
    --pretrained ./models/pretrained/congestion_gpdl/model_iters_170000.pth \
    --max_iters 200 \
    --data_root ./data/target_dataset/superblue19/  \
    --ann_file_train ./data/target_dataset/superblue19.csv  \
    --dataset_type SuperBlueDataset
if [ $? -eq 0 ]; then
    echo "superblue19 done"
else
    echo "superblue19 failed"
fi

# test
echo "start testing"
