close all;
clear all;
tic;
Setting=getSettings();
FE = Setting.Mode;
batch = Setting.BatchNumber;
if FE ==1
    Setting=CNN_FE(Setting);
    Setting=batchPooling(Setting);
    BatchTest(Setting);
else
    Setting=batchPooling(Setting);
    BatchTest(Setting);
end
toc