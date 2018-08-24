clc;
clear;
close all;
warning off;
addpath 'func\'
rng(1);

%产生随机网络
%Num--顶点个数，Per--连接概率，avg_length--边的平均长度
Num          = 100;
K            = 2;
Per          = 0.005;
[matrix,x,y] = func_NW_network(Num,K,Per);

%随机进攻,模拟500次，看其受抗毁能力
X1 = [];
X2 = [];
X3 = [];

for kk = 1:500
    kk
    matrixs = matrix;
    for i=1:Num 
        for j=i+1:Num
            if matrix(i,j)~=0
               %以一定概率进行攻击
               p = rand;
               if p > 0.9
                  matrixs(i,j) = 0; 
               end
            end
        end
    end
    %计算相应的指标
    [Cc,Cc_avg]          = func_Cluster_Coeff(matrixs);
    [Dds,Dds_avg,M,P_Dds]= func_Degree_Distribution(matrixs);  
    [Lens,Lens_avg]      = func_Path_Length(matrixs);   
    if Lens_avg < 10000
       X1 = [X1,Cc_avg];
       X2 = [X2,Dds_avg];
       X3 = [X3,Lens_avg];
    end
end

figure;
subplot(311);
plot(X1);
xlabel('模拟随机攻击次数');
ylabel('聚类系数变化');
subplot(312);
plot(X2);
xlabel('模拟随机攻击次数');
ylabel('平均度变化'); 
subplot(313);
plot(X3);
xlabel('模拟随机攻击次数');
ylabel('平均路径长度变化');  
 
save atrack1.mat X1 X2 X3 
 


std(X1/max(X1))
std(X2/max(X2))
std(X3/max(X3))






