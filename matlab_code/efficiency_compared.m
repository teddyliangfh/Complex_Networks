clc;
clear;
close all;
warning off;

figure;
load A_random\atrack3.mat
plot(Pset,Eg,'b','linewidth',2);
hold on
load B_scalefree\atrack3.mat
plot(Pset,Eg,'r','linewidth',2);
hold on
load C_小世界\atrack3.mat
plot(Pset,Eg,'k','linewidth',2);
hold on
load D_NW小世界\atrack3.mat
plot(Pset,Eg,'g','linewidth',2);
hold on
load E_改进结构网络\atrack3.mat
plot(Pset,Eg,'m','linewidth',2);
hold on

legend('随机网络','无标度网络','WS小世界网络','NW小世界网络','改进型小世界+无标度统一结构模型');
xlabel('p = fraction of removed nodes'); 
ylabel('efficiency'); 
axis([0,1,0,0.5]);