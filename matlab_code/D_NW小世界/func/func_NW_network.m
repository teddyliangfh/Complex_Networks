function [matrix,x,y] = func_NW_network(Num,K,Per);
 
%构建小世界 
angle = 2*pi/Num:2*pi/Num:2*pi;  
x     = 100*sin(angle);
y     = 100*cos(angle);
matrix= zeros(Num);
%最近邻耦合网络
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

[m,n] = find(matrix==0);         
for i=1:length(m)
    if m(i)~=n(i)
       p1=rand();
       if Per > p1
          %加边  
          matrix(m(i),n(i))=1;  
          matrix(n(i),m(i))=1;
       end
    end
end


 

