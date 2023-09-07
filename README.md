# Sample code for ICISC 2023 phlexing.

## Overview

This branch hosts the sample codes for ICISC 2023 Phlexing "Machine Learning driven Static IR drop estimation of SoC power grid network".

Whole data will be released next week.

## Prerequisites

Dependencies can be installed using pip:

```sh
pip install -r requirements.txt
```

PyTorch is not included in requirement.txt, and you could install it following the instruction on PyTorch homepage [https://pytorch.org/](https://pytorch.org/).

Our experiments run on Python 3.9 and PyTorch 1.11. Other versions should work but are not tested.

## IR Drop Prediction

### Data Preparation

There are 2 sample data in /feature_extraction/data, which are the reports from GloryBolt, containing power, resistance and IR drop. We will use them for preprocessing and training.

Please run the following codes one by one.

Parsing the report and turn them into images (numpy array) through tiling.

```python
python ./feature_extraction/process_data.py
```

Preprocessing the numpy array to facilitate model training.

```python
python ./feature_extraction/generate_training_set.py
```

Generating the annotation csv to control the data allocation.

```python
python ./feature_extraction/generate_csv.py
```

### Model Training and Testing.

We use a simple FCN as example, which takes in effective resistance and power, and output IR drop prediction.

Model Training.

```python
python ./sample_model_training/train.py --args args/train.json
```

Model Testing.

```python
python ./sample_model_training/test.py --args args/test.json
```
