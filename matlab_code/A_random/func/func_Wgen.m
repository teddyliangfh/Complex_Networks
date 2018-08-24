function A=func_Wgen(p,N,alph);     
A=zeros(N);
for i=1:N
    for j=1:N
         random_data=rand(1,1);
         if p(i,j)>=random_data&A(i,j)==0
            A(i,j)=1; 
            A(j,i)=1;
         end
    end
end