function H=Homogeneity(outt)
outt=mat2gray(outt);
[m n]=size(outt);
for i=1:m
    for j=1:n
        H=sum(outt(i,j)./(1+abs(i-j)));
    end
end