# Biologically Inspired Lateral Connectivityin Convolutional Neural Networks

## User Guide

### Installation

This module uses Python 3.6.8. All required packages can be found in the requiremens.txt file.

When using CUDA use the following PyTorch and torchvision versions:
```bash
# torch
$ pip3 install https://download.pytorch.org/whl/cu100/torch-1.1.0-cp36-cp36m-linux_x86_64.whl

# torchvision
$ pip3 install https://download.pytorch.org/whl/cu100/torchvision-0.3.0-cp36-cp36m-linux_x86_64.whl
```

### Usage
The working directory for all main scripts is the root folder `inhibition-net/` of this repository.
The main script used for experiment is `experiments/train_multiple.py` which requires the strategy as argument.
Optionally, the number of iterations can be passed as an argument.

```
python experiment/train_multiple.py baseline

# use for help, all available strategies and additional optional parameters
python experiment/train_multiple.py --help

```

A different script for CapsNet is available as it uses a different train function than our main experiments.
```
python model/network/capsnet.py {capsnet, inhib_capsnet} 

# use for help and additional optional parameters
python model/network/capsnet.py --help

```
### Output
Every Model generates a unique experiment id used in the file names for saved models and optimizers, log files and a keychain.txt to lookup the belonging experiment configurations.
The keychain contains tab-separated the id, the experiment group and an iteration index (i.e. baseline_15), the representation of the model and a timestamp.
This keychain is used to load saved models for visualizations and analysis.