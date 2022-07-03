function [ accuracy] = compute_result( trainsample1,testsample1, classnum,trls,ttls,alpha,u)

tr_num=size(trainsample1,2);  
te_num=size(testsample1,2); 
Z=zeros(tr_num,te_num);
Lambda=zeros(tr_num,te_num);
I=eye(tr_num,tr_num);

for i=1:50
    W=(trainsample1'*trainsample1+u*I)\(trainsample1'*testsample1-Lambda+u*Z);
    Z=shrinkage(W+Lambda/u,alpha/u);
    Lambda= Lambda+u*(W-Z);
end

[accuracy,pre_label]=computaccuracy(trainsample1,classnum,trls,testsample1,ttls,W);

end

