function p=func_connect_per(x,y,Per,avg_length,Num);

dist1 = zeros(Num);
for i=1:Num
    for j=1:Num
        dist1(i,j)=sqrt((x(i)-x(j))^2+((y(i)-y(j)))^2);
    end
end

Max_dist = max(max(dist1));
for i=1:Num
    for j=1:Num
        p(i,j) = Per*exp(-dist1(i,j)/avg_length/Max_dist);
    end
    p(i,i)=0;
end