@echo off

@REM 脚本是错误的，因为跑反实验了，superblue12作为微调，其余四个作为测试
REM test
echo start testing

REM set python path to find routability_ir_drop_prediction module
set PYTHONPATH=E:\szx\CircuitNet_transfer_learning
REM superblue11_a
python test.py ^
    --task congestion_transfer_learning ^
    --pretrained .\models\student_model\superblue12\model_iters_200.pth ^
    --dataroot .\data\target_dataset\transfer_learning_datasets\superblue11_a\ ^
    --ann_file_test .\data\target_dataset\transfer_learning_datasets\superblue11_a.csv ^
    --dataset_type SuperBlueDataset ^
    --cpu > .\log\superblue11_test.log 2>&1
if %errorlevel% == 0 (
    echo superblue11_a done
) else (
    echo superblue11_a failed
)

REM superblue14
python test.py ^
    --task congestion_transfer_learning ^
    --pretrained .\models\student_model\superblue12\model_iters_200.pth ^
    --dataroot .\data\target_dataset\transfer_learning_datasets\superblue14\ ^
    --ann_file_test .\data\target_dataset\transfer_learning_datasets\superblue14.csv ^
    --dataset_type SuperBlueDataset ^
    --cpu > .\log\superblue14_test.log 2>&1
if %errorlevel% == 0 (
    echo superblue14 done
) else (
    echo superblue14 failed
)

REM superblue16_a
python test.py ^
    --task congestion_transfer_learning ^
    --pretrained .\models\student_model\superblue12\model_iters_200.pth ^
    --dataroot .\data\target_dataset\transfer_learning_datasets\superblue16_a\ ^
    --ann_file_test .\data\target_dataset\transfer_learning_datasets\superblue16_a.csv ^
    --dataset_type SuperBlueDataset ^
    --cpu > .\log\superblue16_a_test.log 2>&1
if %errorlevel% == 0 (
    echo superblue16_a done
) else (
    echo superblue16_a failed
)

REM superblue19
python test.py ^
    --task congestion_transfer_learning ^
    --pretrained .\models\student_model\superblue12\model_iters_200.pth ^
    --dataroot .\data\target_dataset\transfer_learning_datasets\superblue19\ ^
    --ann_file_test .\data\target_dataset\transfer_learning_datasets\superblue19.csv ^
    --dataset_type SuperBlueDataset ^
    --cpu > .\log\superblue19_test.log 2>&1
if %errorlevel% == 0 (
    echo superblue19 done
) else (
    echo superblue19 failed
)