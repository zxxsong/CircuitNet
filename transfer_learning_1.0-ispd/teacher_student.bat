@echo off
@REM 脚本是错误的，因为跑反实验了，superblue12作为微调，其余四个作为测试
REM train
echo start training

REM set python path to find routability_ir_drop_prediction module
set PYTHONPATH=E:\szx\CircuitNet_transfer_learning
REM superblue12
python train.py ^
    --task congestion_transfer_learning ^
    --save_path .\models\student_model\superblue12\ ^
    --pretrained .\models\pretrained\congestion_gpdl\model_iters_170000.pth ^
    --dataroot .\data\target_dataset\transfer_learning_datasets\superblue12\ ^
    --ann_file_train .\data\target_dataset\transfer_learning_datasets\superblue12.csv ^
    --dataset_type SuperBlueDataset ^
    --cpu > superblue12.log 2>&1
if %errorlevel% == 0 (
    echo superblue12 done
) else (
    echo superblue12 failed
)