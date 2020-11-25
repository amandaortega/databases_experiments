clc
clear
load('E:\methods\第五章\实验数据\Lorenz1\initial\1\ExpdataX.mat');
load('E:\methods\第五章\实验数据\Lorenz1\initial\1\ExpdataY.mat');
load('E:\methods\第五章\实验数据\Lorenz1\initial\1\ExpdataZ.mat');
DataX=zeros(1,1210);
DataY=zeros(1,1210);
DataZ=zeros(1,1210);
for i=1:1210
    DataX(1,i)=x(1,i*2+4000);
end
for i=1:1210
    DataY(1,i)=y(1,i*2+4000);
end
for i=1:1210
    DataZ(1,i)=z(1,i*2+4000);
end
