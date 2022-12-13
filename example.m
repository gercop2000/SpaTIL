clear;clc;

I=imread('image_1.png');
M=imread('nuclei_mask_1.png');

[nucleiCentroids,nucFeatures] = getNucLocalFeatures(I,M);

model=load('example_data\lymp_svm_matlab_40x.mat');
isLymphocyte = (predict(model.model,nucFeatures(:,1:7)))==1;

coords={nucleiCentroids(isLymphocyte,:),nucleiCentroids(~isLymphocyte,:),};

figure;imshow(I);
hold on;
%[feat,featNames]=getSpaTILFeatures_v2(coords,5,.44);
[feat,featNames]=getSpaTILFeatures_v2(coords);
hold off;
