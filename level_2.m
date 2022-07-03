function [output] = level_2(X,Y,trls,lambda,mu,bl_num,w,h )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a=sqrt(bl_num);
train_mat1=[];train_mat2=[];train_mat3=[];train_mat4=[];train_mat5=[];train_mat6=[];train_mat7=[];train_mat8=[];
train_mat9=[];train_mat10=[];train_mat11=[];train_mat12=[];train_mat13=[];train_mat14=[];train_mat15=[];train_mat16=[];

test_mat1=[];test_mat2=[];test_mat3=[];test_mat4=[];test_mat5=[];test_mat6=[];test_mat7=[];test_mat8=[];
test_mat9=[];test_mat10=[];test_mat11=[];test_mat12=[];test_mat13=[];test_mat14=[];test_mat15=[];test_mat16=[];

for i=1:size(X,2)
  im1=X(:,i);
  im1=reshape(im1,w,h);
  C=mat2cell(im1,ones(a,1)*w/a,ones(a,1)*h/a);  
  C=reshape(C,bl_num,1); 
  train_mat1=[train_mat1,reshape(cell2mat(C(1)),w*h/bl_num,1)];
  train_mat2=[train_mat2,reshape(cell2mat(C(2)),w*h/bl_num,1)];
  train_mat3=[train_mat3,reshape(cell2mat(C(3)),w*h/bl_num,1)];
  train_mat4=[train_mat4,reshape(cell2mat(C(4)),w*h/bl_num,1)];
  train_mat5=[train_mat5,reshape(cell2mat(C(5)),w*h/bl_num,1)];
  train_mat6=[train_mat6,reshape(cell2mat(C(6)),w*h/bl_num,1)];
  train_mat7=[train_mat7,reshape(cell2mat(C(7)),w*h/bl_num,1)];
  train_mat8=[train_mat8,reshape(cell2mat(C(8)),w*h/bl_num,1)];
  train_mat9=[train_mat9,reshape(cell2mat(C(9)),w*h/bl_num,1)];
  train_mat10=[train_mat10,reshape(cell2mat(C(10)),w*h/bl_num,1)];
  train_mat11=[train_mat11,reshape(cell2mat(C(11)),w*h/bl_num,1)];
  train_mat12=[train_mat12,reshape(cell2mat(C(12)),w*h/bl_num,1)];
  train_mat13=[train_mat13,reshape(cell2mat(C(13)),w*h/bl_num,1)];
  train_mat14=[train_mat14,reshape(cell2mat(C(14)),w*h/bl_num,1)];
  train_mat15=[train_mat15,reshape(cell2mat(C(15)),w*h/bl_num,1)];
  train_mat16=[train_mat16,reshape(cell2mat(C(16)),w*h/bl_num,1)];
end

for j=1:size(Y,2)
  im2=Y(:,j);
  im2=reshape(im2,w,h);
  D=mat2cell(im2,ones(a,1)*w/a,ones(a,1)*h/a);  
  D=reshape(D,bl_num,1); 
  test_mat1=[test_mat1,reshape(cell2mat(D(1)),w*h/bl_num,1)];
  test_mat2=[test_mat2,reshape(cell2mat(D(2)),w*h/bl_num,1)];
  test_mat3=[test_mat3,reshape(cell2mat(D(3)),w*h/bl_num,1)];
  test_mat4=[test_mat4,reshape(cell2mat(D(4)),w*h/bl_num,1)];
  test_mat5=[test_mat5,reshape(cell2mat(D(5)),w*h/bl_num,1)];
  test_mat6=[test_mat6,reshape(cell2mat(D(6)),w*h/bl_num,1)];
  test_mat7=[test_mat7,reshape(cell2mat(D(7)),w*h/bl_num,1)];
  test_mat8=[test_mat8,reshape(cell2mat(D(8)),w*h/bl_num,1)];
  test_mat9=[test_mat9,reshape(cell2mat(D(9)),w*h/bl_num,1)];
  test_mat10=[test_mat10,reshape(cell2mat(D(10)),w*h/bl_num,1)];
  test_mat11=[test_mat11,reshape(cell2mat(D(11)),w*h/bl_num,1)];
  test_mat12=[test_mat12,reshape(cell2mat(D(12)),w*h/bl_num,1)];
  test_mat13=[test_mat13,reshape(cell2mat(D(13)),w*h/bl_num,1)];
  test_mat14=[test_mat14,reshape(cell2mat(D(14)),w*h/bl_num,1)];
  test_mat15=[test_mat15,reshape(cell2mat(D(15)),w*h/bl_num,1)];
  test_mat16=[test_mat16,reshape(cell2mat(D(16)),w*h/bl_num,1)];
end
%½µÎ¬
train_mat1=normc(train_mat1); test_mat1=normc(test_mat1);
train_mat2=normc(train_mat2); test_mat2=normc(test_mat2);
train_mat3=normc(train_mat3); test_mat3=normc(test_mat3);
train_mat4=normc(train_mat4); test_mat4=normc(test_mat4);
train_mat5=normc(train_mat5); test_mat5=normc(test_mat5);
train_mat6=normc(train_mat6); test_mat6=normc(test_mat6);
train_mat7=normc(train_mat7); test_mat7=normc(test_mat7);
train_mat8=normc(train_mat8); test_mat8=normc(test_mat8);
train_mat9=normc(train_mat9); test_mat9=normc(test_mat9);
train_mat10=normc(train_mat10); test_mat10=normc(test_mat10);
train_mat11=normc(train_mat11); test_mat11=normc(test_mat11);
train_mat12=normc(train_mat12); test_mat12=normc(test_mat12);
train_mat13=normc(train_mat13); test_mat13=normc(test_mat13);
train_mat14=normc(train_mat14); test_mat14=normc(test_mat14);
train_mat15=normc(train_mat15); test_mat15=normc(test_mat15);
train_mat16=normc(train_mat16); test_mat16=normc(test_mat16);

new_feature1 = errorfeature( train_mat1,test_mat1,trls,lambda,mu );
new_feature2 = errorfeature( train_mat2,test_mat2,trls,lambda,mu );
new_feature3 = errorfeature( train_mat3,test_mat3,trls,lambda,mu );
new_feature4 = errorfeature( train_mat4,test_mat4,trls,lambda,mu );
new_feature5 = errorfeature( train_mat5,test_mat5,trls,lambda,mu );
new_feature6 = errorfeature( train_mat6,test_mat6,trls,lambda,mu );
new_feature7 = errorfeature( train_mat7,test_mat7,trls,lambda,mu );
new_feature8 = errorfeature( train_mat8,test_mat8,trls,lambda,mu );
new_feature9 = errorfeature( train_mat9,test_mat9,trls,lambda,mu );
new_feature10 = errorfeature( train_mat10,test_mat10,trls,lambda,mu );
new_feature11 = errorfeature( train_mat11,test_mat11,trls,lambda,mu );
new_feature12 = errorfeature( train_mat12,test_mat12,trls,lambda,mu );
new_feature13 = errorfeature( train_mat13,test_mat13,trls,lambda,mu);
new_feature14 = errorfeature( train_mat14,test_mat14,trls,lambda,mu );
new_feature15 = errorfeature( train_mat15,test_mat15,trls,lambda,mu );
new_feature16 = errorfeature( train_mat16,test_mat16,trls,lambda,mu );
output=(1/16)*( new_feature1+ new_feature2+ new_feature3+ new_feature4+ new_feature5+ new_feature6+ new_feature7+ new_feature8+ new_feature9+ new_feature10+ new_feature11+ new_feature12 +new_feature13+ new_feature14+ new_feature15+ new_feature16);
 
end

