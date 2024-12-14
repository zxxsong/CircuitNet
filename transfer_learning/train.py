import os
import json
import torch
import torch.optim as optim
from tqdm import tqdm

from routability_ir_drop_prediction.datasets.build_dataset import build_dataset
from routability_ir_drop_prediction.train import CosineRestartLr, checkpoint
from routability_ir_drop_prediction.utils.configs import Parser
from routability_ir_drop_prediction.utils.losses import build_loss
from routability_ir_drop_prediction.models.build_model import build_model

def train():
    argp = Parser()
    arg = argp.parser.parse_args()
    arg_dict = vars(arg)
    if arg.arg_file is not None:
        with open(arg.arg_file, 'rt') as f:
            arg_dict.update(json.load(f))

    if not os.path.exists(arg_dict['save_path']):
        os.makedirs(arg_dict['save_path'])
    with open(os.path.join(arg_dict['save_path'], 'arg.json'), 'wt') as f:
        json.dump(arg_dict, f, indent=4)

    arg_dict['ann_file'] = arg_dict['ann_file_train']
    arg_dict['test_mode'] = False

    print('===> Loading target datasets')
    # Initialize dataset
    target_dataset = build_dataset(arg_dict)

    print('===> Building teacher model')
    # Initialize teacher model parameters
    teacher_model = build_model(arg_dict)
    if not arg_dict['cpu']:
        teacher_model = teacher_model.cuda()

    print('===> Building student model')
    # Initialize student model parameters
    student_model = build_model(arg_dict)
    if not arg_dict['cpu']:
        student_model = student_model.cuda()

    # Build loss
    soft_loss = build_loss(arg_dict)
    hard_loss = build_loss(arg_dict)

    # Build Optimzer
    optimizer = optim.AdamW(student_model.parameters(), lr=arg_dict['lr'], betas=(0.9, 0.999),
                            weight_decay=arg_dict['weight_decay'])

    # Build lr scheduler
    cosine_lr = CosineRestartLr(arg_dict['lr'], [arg_dict['max_iters']], [1], 1e-7)
    cosine_lr.set_init_lr(optimizer)

    epoch_loss = 0
    iter_num = 0
    print_freq = 1
    save_freq = 10

    while iter_num < arg_dict['max_iters']:
        with tqdm(total=print_freq) as bar:
            for feature, label, _ in target_dataset:
                if arg_dict['cpu']:
                    input, target = feature, label
                else:
                    input, target = feature.cuda(), label.cuda()

                regular_lr = cosine_lr.get_regular_lr(iter_num)
                cosine_lr._set_lr(optimizer, regular_lr)

                teacher_prediction = teacher_model(input)
                student_prediction = student_model(input)

                optimizer.zero_grad()

                pixel_loss = soft_loss(student_prediction, teacher_prediction)
                pixel_loss += hard_loss(student_prediction, target)

                epoch_loss += pixel_loss.item()
                pixel_loss.backward()
                optimizer.step()

                iter_num += 1

                bar.update(1)

                if iter_num % print_freq == 0:
                    break

        print("===> Iters[{}]({}/{}): Loss: {:.4f}".format(iter_num, iter_num, arg_dict['max_iters'],
                                                           epoch_loss / print_freq))
        if iter_num % save_freq == 0:
            checkpoint(student_model, iter_num, arg_dict['save_path'])
        epoch_loss = 0


if __name__ == "__main__":
    train()