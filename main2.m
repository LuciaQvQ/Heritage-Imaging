clear all
close all
imageDir = fullfile(toolboxdir('vision'),'visiondata','upToScaleReconstructionImages');
images = imageDatastore(imageDir);
I1 = readimage(images, 1);
I2 = readimage(images, 2);

% Convert Color image to gray image
im1=rgb2gray(I1);
im2=rgb2gray(I2);

tform = randomAffine2d('Scale',[1.2,2.4],'XTranslation',[100 200],'Rotation',[-45,45]);
% load('tform.mat')
centerOutput = affineOutputView(size(im1),tform,'BoundsStyle','centerOutput');

im2=imwarp(im1,tform,"cubic","OutputView",centerOutput);

mosaic(im1,im2  );

figure,imshowpair(im1,im2,'montage')

[~,H]=my_sift(im1,im2);
