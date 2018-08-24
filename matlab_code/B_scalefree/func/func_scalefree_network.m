function [matrix,x,y] = func_scalefree_network(Num);

XY_data = 1000*rand(2,Num);
x       = XY_data(1,:);
y       = XY_data(2,:);
Size1   = 8;%表示网络的初始节点个数
Size2   = 4;%表示新点与旧网络连边的数目

%产生稀疏矩阵,邻接矩阵
adjmatrix = sparse(Size1,Size1);
for i=1:Size1
    for j=1:Size1
        if j~=i
           adjmatrix(i,j) = 1;
        end
    end
end
adjmatrix = sparse(adjmatrix);

%定义节点度
Ddegree = zeros(1,Size1+1) ;  
for p = 2:Size1+1
    Ddegree(p) = sum(adjmatrix(1:Size1,p-1));
end
 
for Js = Size1+1:Num
    %迭代之前的网络各个节点的度数之和
    total_degree = 2*Size2*(Js-4)+6;
    cum_degree   = cumsum(Ddegree/total_degree);
    choose       = zeros(1,Size2);
    %第一个和新点相连接点
    r1           = rand();
    choose(1)    = min(find((cum_degree>=r1)==1));
    %第二个和新点相连接点
    r2           = rand();
    choose(2)    = min(find((cum_degree>=r2)==1));
    while choose(2)==choose(1)
          r2        = rand();
          choose(2) = min(find((cum_degree>=r2)==1)) ;
    end
      
    %第三个和新点相连接点
    r3          = rand();
    choose(3)   = min(find((cum_degree>=r3)==1));
     
    while(choose(3)==choose(1))|(choose(3)==choose(2))
          r3 = rand();
          choose(3) = min(find((cum_degree>=r3)==1));
    end
     
     %第四个和新点相连接点
     r4         = rand();
     choose(4)  = min(find((cum_degree>=r4)==1));
     
     while(choose(4)==choose(1))|(choose(4)==choose(2))|(choose(4)==choose(3))
           r4        = rand();
           choose(4) = min(find((cum_degree>=r4)==1));
     end

     for k=1:Size2
         adjmatrix(Js,choose(k)) = 1;
         adjmatrix(choose(k),Js) = 1;
     end
     Ddegree         = zeros(1,Js+1);
     Ddegree(2:Js+1) = sum(adjmatrix);
end
%稀疏矩阵转换为标准矩阵
matrix = full(adjmatrix);
