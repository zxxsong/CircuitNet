@echo off

REM train
echo start testing

REM set python path to find routability_ir_drop_prediction module
set PYTHONPATH=E:\szx\CircuitNet_transfer_learning
REM CircuitNet1.0 - 2.0
python test.py ^
    --task congestion_transfer_learning ^
    --pretrained .\models\student_model\circuitnet2.0\model_iters_20000.pth ^
    --dataroot .\data\target_dataset\circuitnet2.0\ ^
    --ann_file_test .\data\target_dataset\test_N14.csv ^
    --dataset_type CongestionDataset ^
    --cpu > CircuitNet1.0-2.0.txt 2>&1
if %errorlevel% == 0 (
    echo CircuitNet1.0-2.0 done
) else (
    echo CircuitNet1.0-2.0 failed
)