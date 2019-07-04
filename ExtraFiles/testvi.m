VideoAddress = 'KTHUint8\boxing\person01_boxing_d1_uncomp_AviStructureResidual.avi';
SelectedFrame = 24;
SelectedNNLayer = 18;
v = VideoReader(VideoAddress);
i=1;
while hasFrame(v)
    img{i} = readFrame(v);
    i = i+1;
end

net = load('imagenet-vgg-f.mat');
im = img{SelectedFrame};
im_ = single(im);
im_ = imresize(im_, net.meta.normalization.imageSize(1:2));
im_ = im_ - net.meta.normalization.averageImage;
graphical_deconvolution(net, im, im_,'MeasureLayer',SelectedNNLayer);