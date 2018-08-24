clc;
clear;
close all;
warning off;


%产生随机网络
%Num--顶点个数，Per--连接概率，avg_length--边的平均长度
Num          = 100;
K            = 3;
Per          = 0.4;
[matrix,x,y] = func_WSscalefree_network(Num,K,Per);

%分析其efficiency
Pset         = [0.99:-0.001:0.01];
Eg           = [];
for kk = 1:length(Pset)
    kk
    matrixs = matrix;
    for i=1:Num 
        for j=i+1:Num
            if matrix(i,j)~=0
               %以一定概率进行攻击
               p = rand;
               if p < Pset(kk)
                  matrixs(i,j) = 0; 
               end
            end
        end
    end
    %计算efficiency
    Es = 0;
    for i=1:Num 
        for j=i+1:Num
            if matrixs(i,j)~=0 & (sqrt((x(i)-x(j))^2 + (y(i)-y(j))^2)) > 2000*Pset(kk)
               Es = Es + 3e3/(sqrt((x(i)-x(j))^2 + (y(i)-y(j))^2)); 
            end
        end
    end
    Eg = [Eg,Es/Num/(Num-1)];
end 

figure;
plot(Pset,Eg,'linewidth',2);
xlabel('p = fraction of removed nodes'); 
ylabel('efficiency'); 
save atrack3.mat Pset Eg
% axis([0,1,0,0.5]);



