@echo off

REM train
echo start training

REM set python path to find routability_ir_drop_prediction module
set PYTHONPATH=D:\EDA\CircuitNet
REM superblue11_a
python train.py ^
    --task congestion_transfer_learning ^
    --save_path .\models\student_model\superblue11_a\ ^
    --pretrained .\models\pretrained\congestion_gpdl\model_iters_170000.pth ^
    --dataroot .\data\target_dataset\transfer_learning_datasets\superblue11_a\ ^
    --ann_file_train .\data\target_dataset\transfer_learning_datasets\superblue11_a.csv ^
    --dataset_type SuperBlueDataset ^
    --cpu
if %errorlevel% == 0 (
    echo superblue11_a done
) else (
    echo superblue11_a failed
)

REM superblue14
python train.py ^
    --task congestion_transfer_learning ^
    --save_path .\models\student_model\superblue14\ ^
    --pretrained .\models\pretrained\congestion_gpdl\model_iters_170000.pth ^
    --dataroot .\data\target_dataset\transfer_learning_datasets\superblue14\ ^
    --ann_file_train .\data\target_dataset\transfer_learning_datasets\superblue14.csv ^
    --dataset_type SuperBlueDataset ^
    --cpu
if %errorlevel% == 0 (
    echo superblue14 done
) else (
    echo superblue14 failed
)

REM superblue16_a
python train.py ^
    --task congestion_transfer_learning ^
    --save_path .\models\student_model\superblue16_a\ ^
    --pretrained .\models\pretrained\congestion_gpdl\model_iters_170000.pth ^
    --dataroot .\data\target_dataset\transfer_learning_datasets\superblue16_a\ ^
    --ann_file_train .\data\target_dataset\transfer_learning_datasets\superblue16_a.csv ^
    --dataset_type SuperBlueDataset ^
    --cpu
if %errorlevel% == 0 (
    echo superblue16_a done
) else (
    echo superblue16_a failed
)

REM superblue19
python train.py ^
    --task congestion_transfer_learning ^
    --save_path .\models\student_model\superblue19\ ^
    --pretrained .\models\pretrained\congestion_gpdl\model_iters_170000.pth ^
    --dataroot .\data\target_dataset\transfer_learning_datasets\superblue19\ ^
    --ann_file_train .\data\target_dataset\transfer_learning_datasets\superblue19.csv ^
    --dataset_type SuperBlueDataset ^
    --cpu
if %errorlevel% == 0 (
    echo superblue19 done
) else (
    echo superblue19 failed
)

REM test
echo start testing