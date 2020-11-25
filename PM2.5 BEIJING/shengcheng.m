clc
clear
load('E:\methods\第五章\实验数据\pm2.5\initial\2bianliang.mat');


X12=zeros(960,10);
X1=zeros(960,5);
X2=zeros(960,5);
Y1=zeros(960,1);
Y2=zeros(960,1);
for i=1:960
    for j=1:5
        
        X12(i,j)=x(i+5-j,1);
        X12(i,j+5)=x(i+5-j,2);
        
        X1(i,j)=x(i+5-j,1);
        
        X2(i,j)=x(i+5-j,2);
        
    end
    
    Y1(i,1)=x(i+5,1);
    Y2(i,1)=x(i+5,2);
  
    
end

