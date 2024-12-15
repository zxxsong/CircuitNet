#!/bin/bash

# train
echo "start training"

# set python path to find routability_ir_drop_prediction module
export PYTHONPATH=/path/to/CircuitNet

# superblue11_a
python train.py \
    --task congestion_transfer_learning \
    --save_path ./models/scratch/superblue11_a/ \
    --dataroot ./data/target_dataset/transfer_learning_datasets/superblue11_a/ \
    --ann_file_train ./data/target_dataset/transfer_learning_datasets/superblue11_a.csv \
    --dataset_type SuperBlueDataset \
    --cpu > superblue11_a.txt 2>&1
if [ $? -eq 0 ]; then
    echo "superblue11_a done"
else
    echo "superblue11_a failed"
fi

# superblue14
python train.py \
    --task congestion_transfer_learning \
    --save_path ./models/scratch/superblue14/ \
    --dataroot ./data/target_dataset/transfer_learning_datasets/superblue14/ \
    --ann_file_train ./data/target_dataset/transfer_learning_datasets/superblue14.csv \
    --dataset_type SuperBlueDataset \
    --cpu > superblue14.txt 2>&1
if [ $? -eq 0 ]; then
    echo "superblue14 done"
else
    echo "superblue14 failed"
fi

# superblue16_a
python train.py \
    --task congestion_transfer_learning \
    --save_path ./models/scratch/superblue16_a/ \
    --dataroot ./data/target_dataset/transfer_learning_datasets/superblue16_a/ \
    --ann_file_train ./data/target_dataset/transfer_learning_datasets/superblue16_a.csv \
    --dataset_type SuperBlueDataset \
    --cpu > superblue16_a.txt 2>&1
if [ $? -eq 0 ]; then
    echo "superblue16_a done"
else
    echo "superblue16_a failed"
fi

# superblue19
python train.py \
    --task congestion_transfer_learning \
    --save_path ./models/scratch/superblue19/ \
    --dataroot ./data/target_dataset/transfer_learning_datasets/superblue19/ \
    --ann_file_train ./data/target_dataset/transfer_learning_datasets/superblue19.csv \
    --dataset_type SuperBlueDataset \
    --cpu > superblue19.txt 2>&1
if [ $? -eq 0 ]; then
    echo "superblue19 done"
else
    echo "superblue19 failed"
fi