function [tra_l0,tta_l0,tra_l1,tta_l1,tra_l2,tta_l2] = ETF(trdat,ttdat,trls)
%%%parameter

level1_num=4;
level2_num=16;
w=32;
h=32;
lambda1=1e-4;
mu1=1e-2;

%%%%trans
tra0=normc(double(trdat));
tta0=normc(double(ttdat));
tra_l0=errorfeature(tra0,tra0,trls,lambda1,mu1);
tta_l0=errorfeature(tra0,tta0,trls,lambda1,mu1);

tra1=double(trdat);
tta1=double(ttdat);
tra_l1=level_1(tra1,tra1,trls,lambda1,mu1,level1_num,w,h);
tta_l1=level_1(tra1,tta1,trls,lambda1,mu1,level1_num,w,h);

tra3=double(trdat);
tta3=double(ttdat);
tra_l2=level_2(tra3,tra3,trls,lambda1,mu1,level2_num,w,h);
tta_l2=level_2(tra3,tta3,trls,lambda1,mu1,level2_num,w,h);
 
end

