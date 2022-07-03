function [ layer_acc ] = cascadepart( X,Y,train_label,test_label,layer_num,classnum,m1,m2,m3,X1,X2,X3,Y1,Y2,Y3 )

layer_acc=zeros(1,layer_num);
M=[m1 m2 m3];

u=1e-1;
XX=X;
YY=Y;
ZZ=[X1;X2;X3];
JJ=[Y1;Y2;Y3];
mm1=size(X1,1);
mm2=size(X1,2);
nn1=size(Y1,1);
nn2=size(Y1,2);

alpha=1e-4;
for i=1:layer_num
    train_soft=errorfeature(XX,XX,train_label,alpha,u);
    test_soft =errorfeature(XX,YY,train_label,alpha,u);
    [Z1] = coefficient(train_soft,test_soft ,alpha,u,30);
    [m,~] = computaccuracy(train_soft,classnum,train_label,test_soft,test_label,Z1);
    ZZ=[ZZ;train_soft];
    JJ=[JJ;test_soft];

    XX=[];
    YY=[];
     M=[M,m];
     a=sum(M);
     YE=M/a;
     yesize=size(YE,2);
     
     for h=1:yesize
         
         t1=YE(h)*ZZ(((h-1)*mm1+1):h*mm1,1:mm2);
         t2=YE(h)*JJ(((h-1)*nn1+1):h*nn1,1:nn2);
         XX=[XX;t1];
         YY=[YY;t2];
     end

 layer_acc(i)=compute_result( XX,YY,classnum,train_label,test_label,alpha,u);

end
      

