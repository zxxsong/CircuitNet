@echo off

REM train
echo start testing

REM set python path to find routability_ir_drop_prediction module
set PYTHONPATH=D:\EDA\CircuitNet
REM superblue11_a
python test.py ^
    --task congestion_transfer_learning ^
    --pretrained .\models\student_model\superblue11_a\model_iters_20.pth ^
    --dataroot .\data\target_dataset\transfer_learning_datasets\superblue12\ ^
    --ann_file_test .\data\target_dataset\transfer_learning_datasets\superblue12.csv ^
    --dataset_type SuperBlueDataset ^
    --cpu
if %errorlevel% == 0 (
    echo superblue11_a done
) else (
    echo superblue11_a failed
)