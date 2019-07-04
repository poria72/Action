function Setting = generate_path(Setting)
Setting.CP_FeatureVectorsName = strcat('featureVectors_',Setting.DatasetName,'_Check_itteration_save.mat');
Setting.FeatureVectorsFileName = strcat('featureVectors_',Setting.DatasetName,'_VGG');
Setting.PooledFeatureVectorsFileName = strcat(Setting.FeatureVectorsFileName,'_',Setting.PoolingMethod,'_',num2str(Setting.BatchNumber),'_','BatchPooled');
end