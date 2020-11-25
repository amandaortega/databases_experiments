clc
clear
load('E:\methods\第五章\实验数据\pm2.5\initial\pm2.5.mat');
x=zeros(1000,2)
for i=1:1000
    x(i,1)=PRSAdata2010{i+42825,1};
    x(i,2)=PRSAdata2010{i+42825,5};

end
    