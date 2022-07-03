function [Z] = coefficient(X,Y ,alpha,u,max_iter)

tr_num=size(X,2);                        
te_num=size(Y,2);                          

Z=zeros(tr_num,te_num);
Lambda=zeros(tr_num,te_num);
I=eye(tr_num,tr_num);

for i=1:max_iter
   
    W=(X'*X+u*I)\(X'*Y-Lambda+u*Z);

    Z=shrinkage(W+Lambda/u,alpha/u);

    Lambda= Lambda+u*(W-Z);
end

end

