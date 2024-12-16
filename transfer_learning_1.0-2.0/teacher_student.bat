@echo off

REM train
echo start training

REM set python path to find routability_ir_drop_prediction module
set PYTHONPATH=E:\szx\CircuitNet
REM CircuitNet1.0 - 2.0
python train.py ^
    --task congestion_transfer_learning ^
    --save_path .\models\student_model\circuitnet2.0\ ^
    --pretrained .\models\pretrained\congestion_gpdl\model_iters_170000.pth ^
    --dataroot .\data\target_dataset\circuitnet2.0\ ^
    --ann_file_train .\data\target_dataset\train_N14.csv ^
    --dataset_type CongestionDataset ^
    --cpu > CircuitNet1.0-2.0.txt 2>&1
if %errorlevel% == 0 (
    echo CircuitNet1.0-2.0 done
) else (
    echo CircuitNet1.0-2.0 failed
)