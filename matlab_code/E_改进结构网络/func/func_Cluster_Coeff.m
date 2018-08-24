function  [Cc,Cc_avg]=func_Cluster_Coeff(matrix)
 
Num = size(matrix,2);
Cc  = zeros(1,Num);

for i=1:Num
    Index1 = find(matrix(i,:)==1);  
    if isempty(Index1) == 1
       Cc(i)=0;
    else        
        m = length(Index1); 
        if m == 1
           Cc(i)=0;
        else
           B     = matrix(Index1,Index1);   
           Cc(i) = length(find(B==1))/(m*(m-1));
        end
    end
end
Cc_avg=mean(Cc);