function out=CNN_FE(Setting)
DatasetDirectoryName = Setting.DatasetName;
tic;
chPointNum=Setting.FE_CheckpointNumber;
videoCnt=1;
VideoFeatureVector = struct('FeatureVector',[],'Label',[]);
if(chPointNum~=0)
    Setting.CP_FeatureVectorsName = strcat('featureVectors_',Setting.DatasetName,'_Check_itteration_save.mat');
    VideoFeatureVector = matfile(Setting.CP_FeatureVectorsName);
    VideoFeatureVector = VideoFeatureVector.VideoFeatureVector;
end

net = load('imagenet-vgg-f.mat');
dataset = dir(DatasetDirectoryName);
fprintf('Running...\n');

for i=3:size(dataset,1)
    folder = dataset(i);
    label = folder.name;
    files = dir(strcat(DatasetDirectoryName,'/',label));
    for j=3:size(files,1)
        if(videoCnt<chPointNum)
            videoCnt=videoCnt+1;
            continue;
        else
            videoPath = strcat(DatasetDirectoryName,'/',label,'/',files(j).name);
            fv = FE(videoPath,net,Setting);
            VideoFeatureVector(videoCnt).FeatureVector = fv;
            VideoFeatureVector(videoCnt).Label = LabelTranslate(label,DatasetDirectoryName);
            clear fv;
            fprintf('Feature Extracted From Video #%d.\n',videoCnt);
            videoCnt=videoCnt+1;
            if(mod(videoCnt,Setting.FE_CheckpointPeriod)==0)
                filename = strcat('featureVectors_',DatasetDirectoryName,'_Check_itteration_save');
                save(filename,'VideoFeatureVector','-v7.3');
            end
        end
    end
    fprintf('Feature Extracted From %s.\n',label);
end

t=toc;
filename = Setting.FeatureVectorsFileName;
save(filename,'VideoFeatureVector','-v7.3');
fprintf('Features Of All Videos Extracted in %fs\n',t);
out= Setting;
end

%NetType==vgg
function fv = FE(videoPath,net,Setting)
v = mmread(videoPath);
numFrames = v.nrFramesTotal;
fv=zeros(Setting.FeatureVectorsSize,numFrames);
parfor k=1:numFrames-1
    im1=v.frames(k).cdata;
    im2=v.frames(k+1).cdata;
    im = OFPouria(im1,im2);
    im = imresize(im, net.meta.normalization.imageSize(1:2)) ;
    im = single(im);
    im = im - net.meta.normalization.averageImage;
    res = vl_simplenn(net, im) ;
    fv(:,k)=res(Setting.NNLayer).x;
end
end