function Setting = getSettings()
Setting.Mode = 1; % 1:Feature Extraction, 0:Using Extracted Features
Setting.DatasetName = 'jpl_OF'; %used when mode==1, 'jpl_OF','Dogcentric_OF','tv_human_OF','youtubeDog_OF','KTH_OF'
Setting.PoolingMethod = 'Max'; % Trapz,Max,Pyramid
Setting.BatchNumber = 1; %enter a number(1,4,8,12)
Setting = generate_path(Setting);

Setting.Classifier = 1; % 1: SVM , 2:Softmax

Setting.NNLayer = 18; %Layer of Neural network as the Frame Features
Setting.FeatureVectorsSize = 4096; % Don't Change This

Setting.FE_CheckpointNumber = 0; % enter 0 for start feature extraction from first frame of first video
Setting.FE_CheckpointPeriod = 50;% after Period, Extracted Feature will Save(use when your feature extraction progress curreped).

Setting.SVM_Kernel = '-c 4 -t 1 -d 2 -g 1 -b 1'; % Don't Change This
Setting.Train_TestNumber = 100; % Number of Train and Test
Setting.SplitDataThreshold = 0.5; % Threshold of Split Train and Test Data 

%%
Setting.SaveFinalResultInFile = 1; % 0: No, 1: Yes
Setting.SavedFileName = strcat('SavedResults/',Setting.DatasetName,'_',Setting.PoolingMethod,'_',num2str(Setting.BatchNumber),'.txt');
end

