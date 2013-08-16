function graph = GenerateBA(NumNode,MinDeg)

%The code is done to generate BA model of graph, preferential attachment
%till now Mindeg not included
%probability bug removed but its output is slow for large n !


%This is for the undirected one.

graph=zeros(2,2);                                                          % creates the initial 2 node graph
graph(1,2)=1;
graph(2,1)=1;
deg = 0;  %Initialize degree to 0 but not needed now
n=3;
    for i=4:NumNode+1               %loop to add NumNode number of Nodes
        cumulative = 0;
            for k=1:unique(size(graph)) %calculates the prob for each node and keeps it's cumulative value in val
                prob(k)=nnz(graph(k,:))/nnz(graph);
                val(k)=cumulative + prob(k);
                cumulative = cumulative + prob(k);
            end
         
              for in=1:inf        
                if n<i             % loops untill an node is added
                edgeProb=rand();
                for k=1:unique(size(graph))
                     if(val(k) > edgeProb && j~=k) % to pervent self loop and check with prob value.
                         graph(n,k)=1;
                        graph(k,n)=1;
                        n=n+1;     
                      break;
                     end
                end
                else
                    break;
                end
              end
        graph                                                              %prints the adjacency matrix.
    end
    for i = 1 : unique(size(graph))                                        %find degree distribution
        x(i) = nnz (graph(i,:));
    end 
    plot(1:unique(size(graph)),x)                                          % plot the degree distribution
end

