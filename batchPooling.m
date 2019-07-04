function out = batchPooling(Setting)

VideoFeatureVectorFileName = Setting.FeatureVectorsFileName;
batchNum = Setting.BatchNumber;
operator = Setting.PoolingMethod;
features = matfile(strcat(VideoFeatureVectorFileName,'.mat'));
features = features.VideoFeatureVector;
cnt=1;
tic;
for i=1:size(features,2)
    a=features(i).FeatureVector;
    
    frameNum = size(a,2);
    autoBatch = batchNum;
    batchSize = floor(frameNum/autoBatch);
    for itt=1:autoBatch
        start_ = (itt-1)*batchSize+itt;
        end_ = itt*batchSize+itt;
        if(end_>frameNum)
            end_=frameNum;
        end
        if(start_>=end_)
            break;
        end
        featureVector(cnt).Label = features(i).Label;
        featureVector(cnt).VideoNumber = i;
        if(string(operator) == string('Max'))
            featureVector(cnt).FeatureVector=max(a(:,start_:end_),[],2);
        elseif(string(operator) == string('Trapz'))
            featureVector(cnt).FeatureVector=trapz(a(:,start_:end_),2);
        elseif(string(operator) == string('Pyramid'))
            featureVector(cnt).FeatureVector=PyramidPooling(a,'Max');
        else
            disp('Error in Inputs!!!\n\n');
            break;
        end
        cnt=cnt+1;
    end
    fprintf('loop %d\n',i);
end
t=toc;
Setting.PooledFeatureVectorsFileName=strcat(Setting.FeatureVectorsFileName,'_',Setting.PoolingMethod,'_',num2str(Setting.BatchNumber),'_','BatchPooled');
filename = Setting.PooledFeatureVectorsFileName;
save(filename,'featureVector');
fprintf('Fetures Pooled in %fs\n',t);
out= Setting;
end