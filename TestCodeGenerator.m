fcnName = 'mResNet_classify';
cfg = coder.config('lib');
cfg.TargetLang = 'C++';

dlcfg = coder.DeepLearningConfig('arm-compute');
dlcfg.ArmArchitecture = 'armv7';
dlcfg.ArmComputeVersion = '19.02';

cfg.DeepLearningConfig = dlcfg;
hw = coder.hardware('Raspberry Pi');
cfg.Hardware = hw;
cfg.Hardware.BuildDir = '~/im_classify';
cfg.VerificationMode = 'PIL';

vectorType = coder.typeof(0,[15,15,3],[1 1 0]);
codegen -config cfg mResNet_classify -args {vectorType} -report

im = imread('STOP.png');
outimg = mResNet_classify_pil(double(im));
imshow(outimg);