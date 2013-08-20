function x=GenerateBA(NumNode,MinDeg)
%the code is done to generate BA model of graph, preferential attachment
%till now Mindeg not included
%code is buggy but produces result on prob bases. if gets stuck in some
%error of index out of bound run it again, it may run in the next run.
%Probabilistic error still to be debugged.
graph=zeros(2,2);                                                          % creates the initial 2 node graph
graph(1,2)=1;
graph(2,1)=1;
deg = 0;                                                                   %Initialize degree to 0 but not needed now

    for i=1:NumNode                                                        %loop to add NumNode number of Nodes
        cumulative = 0;
        for k=1:unique(size(graph))                                        %calculates the prob for each node and keeps it's cumulative value in val
            prob(k)=nnz(graph(k,:))/nnz(graph);
            val(k)=cumulative + prob(k);
            cumulative = cumulative + prob(k);
        end 
          value_length=unique(size(graph));
                                                                           % the allocation of edge based on the prob value.
           j=i+1;                                                          %Denote addition of new vertex
           for in=1:MinDeg                                                 % mindeg number of nodes added.
            edgeProb=rand();
            for k=1:value_length;
                 if(val(k) >= edgeProb && j~=k)                             % to pervent self loop and check with prob value.
                     graph(j,k)=1;
                     graph(k,j)=1;
                   break;
                 end
            end
           end
       % graph
    end
    for i = 1 : unique(size(graph)) %find degree distribution
        x(i) = nnz (graph(i,:));
    end
   hist(x,unique(x))                                                       % hist plot against x and count of x.
   %[a b]=hist(x,unique(x));
   %scatter(b,a);           % to create and to plot scatter of deg Vs count
   %make it log above to make it log-log 
end
