function [Dds,Dds_avg,M,P_Dds]=func_Degree_Distribution(matrix)
 
Num = size(matrix,2);
Dds = zeros(1,Num);
for i=1:Num
    Dds(i)=sum(matrix(i,:));
end
Dds_avg = mean(Dds);

 
 
M=max(Dds);
for i=1:M+1;   
    Num_Dds(i) = length(find(Dds==i-1));
end
P_Dds    = zeros(1,M+1);
P_Dds(:) = Num_Dds(:)./sum(Num_Dds);

 



