function graph=GenerateBA(NumNode,MinDeg)
%the code is done to generate BA model of graph, preferential attachment
  graph=[0 1; 1 0];                                                        %creates the initial 2 node graph
    for i=1:NumNode                                                        %loop to add NumNode number of Nodes
        val =cumsum( sum(graph,2)/sum(sum(graph)) );                       %finding cumulative probability value   
           for in=1:MinDeg                                                 %mindeg number of nodes added.
              edgeProb=rand();                                             %generate random value
              pos=find( (val - edgeProb) >= 0 );                           %find the selected nodefrom the cumsum val.
              graph(i+1,pos(1))=1;                                         %create the edges for undirected
              graph(pos(1),i+1)=1;                                         %remove this to make it directed
           end
    end
  x = sum(graph,2);                                                        %finding the deg value of each node.
   %hist(x,unique(x))                                                      % hist plot against x and count of x.
  [a b]=hist(x,unique(x));
  scatter(b,a);                                                            % to create and to plot scatter of deg Vs count
end
