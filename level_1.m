function [ output ] = level_1( X,Y,trls,lambda,mu,bl_num,w,h )

a=sqrt(bl_num);
train_mat1=[];train_mat2=[];train_mat3=[];train_mat4=[];
test_mat1=[];test_mat2=[];test_mat3=[];test_mat4=[];

for i=1:size(X,2)
  im1=X(:,i);
  im1=reshape(im1,w,h);
  C=mat2cell(im1,ones(a,1)*w/a,ones(a,1)*h/a);  
  C=reshape(C,bl_num,1); 
  train_mat1=[train_mat1,reshape(cell2mat(C(1)),w*h/bl_num,1)];
  train_mat2=[train_mat2,reshape(cell2mat(C(2)),w*h/bl_num,1)];
  train_mat3=[train_mat3,reshape(cell2mat(C(3)),w*h/bl_num,1)];
  train_mat4=[train_mat4,reshape(cell2mat(C(4)),w*h/bl_num,1)];
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
end
train_mat1=normc(train_mat1); test_mat1=normc( test_mat1);
train_mat2=normc(train_mat2); test_mat2=normc( test_mat2);
train_mat3=normc(train_mat3); test_mat3=normc( test_mat3);
train_mat4=normc(train_mat4); test_mat4=normc( test_mat4);

new_feature1 = errorfeature( train_mat1,test_mat1,trls,lambda,mu);
new_feature2 = errorfeature( train_mat2,test_mat2,trls,lambda,mu);
new_feature3 = errorfeature( train_mat3,test_mat3,trls,lambda,mu);
new_feature4 = errorfeature( train_mat4,test_mat4,trls,lambda,mu);
  

output=(1/4)*(new_feature1+new_feature2+new_feature3+new_feature4);
end

