%To incoporate the network model for epidemic analysis.
function result=GraphEpiSim(Graph,InitialInfection,Levels)
%If a graph(adjacency matrix) with number of initial infected, 
%with how many levels the virus must spread. gives you the result 
%as node and the level they were infected with 0 means not infected.
NumNode = unique(size(Graph));                                 %Size of network is used
Suscep=zeros(1,NumNode);                                       %Initaillsing All population as Susceptible
                                                               %Initial Infection of nodes
Initial = round(rand(1,InitialInfection)*NumNode);
Suscep(Initial) = 1;
                                                               %Initialization for infection
Inf = Initial;
iteration=1;
allN=Initial(1);
                                                               %Iteration of spreading in the network.
while(iteration < Levels)
    for i=1:length(Inf)
        neig = find(Graph(Inf(i),:) ~= 0);
        allN = [allN neig];
    end
    uniN = unique(allN);
    Inf = setdiff(uniN,find(Suscep ~= 0));
    Suscep(Inf)=iteration;
    Suscep
    iteration=iteration+1;
end
result=nnz(Suscep);
end
