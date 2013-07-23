function mat = rateMatrixGen(Rvector)
mat = diag(Rvector);
len = length(Rvector);
    for i = 1: len
            if(i==len)
                ind = 1;
            else 
                ind = i+1;
            end
            mat(i,ind)= mat(i,i);
            mat(i,i)  = 1 - mat(i,i);
    end
end
