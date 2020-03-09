%Project Title: Road Sign Recognition
%Module Title: Test Code Generator
%Description: Script for the automatic code generation for PIL
%Authors: Damiano Vandi, Matteo Lenti, Filippo Cenonfolo

r=raspi();
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

vectorType = coder.typeof(ones(15,15,3), [2000,2000,3], [1 1 0]);
codegen -config cfg mResNet_classify -args {vectorType} -report
