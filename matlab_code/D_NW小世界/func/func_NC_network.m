function [matrix,x,y] = func_NC_network(Num,K);
 
angle = 2*pi/Num:2*pi/Num:2*pi;  
x     = 100*sin(angle);
y     = 100*cos(angle);
matrix= zeros(Num);
%×î½üÁÚñîºÏÍøÂç
for i1=1:Num
    for j1=i1+1:i1+K
        j2=j1;
        if j1 > Num
           j2 = mod(j1,Num);
        end
      matrix(i1,j2) = 1; 
      matrix(j2,i1) = 1;     
    end
end

 

