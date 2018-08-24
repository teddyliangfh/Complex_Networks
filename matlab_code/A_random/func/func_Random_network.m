function [matrix,x,y]=func_Random_network(Num,Per,avg_length)
 
XY_data = 1000*rand(2,Num);
x       = XY_data(1,:);
y       = XY_data(2,:);
%两节点边连接概率
p       = func_connect_per(x,y,Per,avg_length,Num);
matrix  = func_Wgen(p,Num,Per);