clear all;
DatasetDirectoryName='KTH';
FinalFolderName = 'KTH_OF/';
chPointNum=0;
videoCnt=1;
dataset = dir(DatasetDirectoryName);
fprintf('Running...\n');
for i=3:size(dataset,1)
    folder = dataset(i);
    label = folder.name;
    files = dir(strcat(DatasetDirectoryName,'/',label));
    
    for j=3:size(files,1)
        if videoCnt<=chPointNum
            videoCnt= videoCnt+1;
            continue;
        else
            videoPath = strcat(DatasetDirectoryName,'/',label,'/',files(j).name);
            v = mmread(videoPath);
            numFrames = v.nrFramesTotal;
            images = cell(numFrames,1);
            mkdir(strcat(FinalFolderName,label));
            a = struct('img',[]);
            parfor k=1:numFrames-1
                im1=v.frames(k).cdata;
                im2=v.frames(k+1).cdata;
                im=im2frame(OFPouria(im1,im2));
                a(k).img = im.cdata;
            end
            writerObj = VideoWriter(strcat(FinalFolderName,label,'/', files(j).name));
            open(writerObj);
            for p = 1:numFrames-1
                writeVideo(writerObj,a(p).img);
            end
            close(writerObj);
            clear a;
            fprintf('Feature Extracted From Video #%d.\n',videoCnt);
            videoCnt = videoCnt+1;
        end
    end
end