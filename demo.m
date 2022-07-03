%% ML-CSR framwork
clc
clear
load('Yaleb')
trnum=15;
[ trdat,ttdat,trls,ttls ] = initial_data(fea,gnd,trnum);
%% parameter
classnum=length(unique(trls));
lambda2=1e-4;
mu2=1;
lm=1;
%% ERROR TO FEATURE PART
[tra_l0,tta_l0,tra_l1,tta_l1,tra_l2,tta_l2] = ETF(trdat,ttdat,trls);
%% GENERATE ADAPTIVE WEIGHT
[Z0] = coefficient(tra_l0,tta_l0 ,lambda2,mu2,200);
[accuracy0,~] = computaccuracy(tra_l0,classnum,trls,tta_l0,ttls,Z0);
[Z1] = coefficient(tra_l1,tta_l1 ,lambda2,mu2,200);
[accuracy1,~] = computaccuracy(tra_l1,classnum,trls,tta_l1,ttls,Z1);
[Z2] = coefficient(tra_l2,tta_l2 ,lambda2,mu2,200);
[accuracy2,~] = computaccuracy(tra_l2,classnum,trls,tta_l2,ttls,Z2);
%% ATTENTION MODULE
TT = accuracy0+accuracy1+accuracy2;
t0=accuracy0/TT;
t1=accuracy1/TT;
t2=accuracy2/TT;
%% DEEP CASCADE
trainsample=[t0*tra_l0;t1*tra_l1;t2*tra_l2];
testsample=[t0*tta_l0;t1*tta_l1;t2*tta_l2];  
layer_acc=cascadepart( trainsample,testsample,trls,ttls,lm,classnum,accuracy0,accuracy1,accuracy2,tra_l0,tra_l1,tra_l2,tta_l0,tta_l1,tta_l2);
%% result
acc = max(layer_acc);
fprintf('The accuracy is %8.5f%%\n', acc*100) 

 