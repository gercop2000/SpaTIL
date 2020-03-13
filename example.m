clear;clc;

I=imread('image.png');
M=imread('nuclei_mask.png');

[nucleiCentroids,nucFeatures] = getNucLocalFeatures(I,M);

model=load('D:\German\Dropbox\histopat\app\tils_prognosis\lymph_detection_model\models\lymp_svm_matlab_wsi.mat');
isLymphocyte = (predict(model.model,nucFeatures(:,1:7)))==1;

coords={nucleiCentroids(isLymphocyte,:),nucleiCentroids(~isLymphocyte,:),};

figure;imshow(I);
hold on;
%[feat,featNames]=getSpaTILFeatures_v2(coords,5,.44);
[feat,featNames]=getSpaTILFeatures_v2(coords);
hold off;
