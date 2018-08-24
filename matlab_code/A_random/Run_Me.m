clc;
clear;
close all;
warning off;
addpath 'func\'
rng(1);

%产生随机网络
%Num--顶点个数，Per--连接概率，avg_length--边的平均长度
Num          = 100;
Per          = 0.036;
avg_length   = 100;
[matrix,x,y] = func_Random_network(Num,Per,avg_length);

figure;
plot(x,y,'r.','Markersize',18);
hold on;
for i=1:Num 
    for j=i+1:Num
        if matrix(i,j)~=0
           plot([x(i),x(j)],[y(i),y(j)],'b--','linewidth',1);
           hold on;
        end
    end
end
hold off

%计算相应的指标
[Cc,Cc_avg]          = func_Cluster_Coeff(matrix);
disp(['聚类系数为：',num2str(Cc_avg)]);
[Dds,Dds_avg,M,P_Dds]= func_Degree_Distribution(matrix);
disp(['平均度为：',num2str(Dds_avg)]);   
[Lens,Lens_avg]      = func_Path_Length(matrix);   
disp(['平均路径长度为：',num2str(Lens_avg)]); 



figure;  
subplot(211);
bar([1:Num],Dds);  
xlabel('节点编号');
ylabel('节点的度');
subplot(212);
bar([0:M],P_Dds,'r');
xlabel('节点的度');
ylabel('节点度的概率');
 
 
 









