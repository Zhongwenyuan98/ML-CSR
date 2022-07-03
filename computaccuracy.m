function [accuracy,pre_label]=computaccuracy(trainsample,classnum,trls,testsample,ttls,W)
test_tol=size(testsample,2);
train_tol=size(trainsample,2);
pre_label=zeros(1,test_tol);
h = waitbar(0,'Please wait...');
ttt=[];
for i=1:test_tol
    xp = W(:,i);
    for j=1:classnum
        mmu=zeros(train_tol,1);
        ind=(j==trls);
        mmu(ind)=xp(ind);
        r(j)=norm(testsample(:,i)-trainsample*mmu);
    end
    [temp,index]=min(r);
    pre_label(i)=index;
    per = i / test_tol;
    waitbar(per, h ,sprintf('%2.0f%%',per*100))
    aaa=r;
    ttt=[ttt;aaa];
end
close(h)
accuracy=sum(pre_label==ttls)/test_tol;

