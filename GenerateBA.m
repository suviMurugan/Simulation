function graph=GenerateBA(NumNode,MinDeg)
graph=zeros(2,2);
graph(1,2)=1;
graph(2,1)=1;
deg = 0;
    for i=1:NumNode
        for j=i-1:-1:1
            val=nnz(graph(j,:)) / nnz(graph);
            if(val < rand() && i ~= j)
                graph(i,j)=1;
                graph(j,i)=1;
                deg = deg+1;
                
                if(deg >= MinDeg)
                    deg=0;
                    break;
                end
            end
        end
        graph
    end
    
end
