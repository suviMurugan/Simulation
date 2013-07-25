%To incoporate the network model for epidemic analysis.
function result=GraphEpiSim(NumNode,InitialInfection,Levels)
%network as Adjacency Matrix first want to model spread.
Mat= GenerateGraph();                                          %Generation of Random Network
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
        neig = find(Mat(Inf(i),:) == 1);
        allN = [allN neig];
    end
    uniN = unique(allN);
    Inf = setdiff(uniN,find(Suscep == 1));
    Suscep(Inf)=iteration;
    Suscep
    iteration=iteration+1;
    
end
result=nnz(Suscep);
end
