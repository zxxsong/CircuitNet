from routability_ir_drop_prediction.models.build_model import build_model

def build_teacher_model(opt):
    return build_model(opt)

def build_student_model(opt):
    return build_model(opt)