clear all;
DatasetDirectoryName='youtubeDog';
FinalFolderName = 'youtubeDog2/';
videoCnt=1;
dataset = dir(DatasetDirectoryName);
fprintf('Running...\n');
for i=3:size(dataset,1)
    folder = dataset(i);
    label = folder.name;
    files = dir(strcat(DatasetDirectoryName,'/',label));
    
    for j=3:size(files,1)
        videoPath = strcat(DatasetDirectoryName,'/',label,'/',files(j).name);
        imgs = dir(videoPath);
        a = struct('img',[]);
        mkdir(strcat(FinalFolderName,label));
        parfor k=3:size(imgs,1)
            im1=imread(strcat(videoPath,'/',imgs(k).name));
            im=im2frame(im1);
            a(k-2).img = im.cdata;
        end
        writerObj = VideoWriter(strcat(FinalFolderName,label,'/', files(j).name,'.avi'));
        open(writerObj);
        for p = 1:size(imgs,1)-2
            writeVideo(writerObj,a(p).img);
        end
        close(writerObj);
        clear a imgs;
        fprintf('Feature Extracted From Video #%d.\n',videoCnt);
        videoCnt = videoCnt+1;
    end
end