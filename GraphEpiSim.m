%To incoporate the network model for epidemic analysis.
function result=GraphEpiSim()
%network as Adjacency Matrix first want to model spread.
Mat=round(rand(100));

%Start Spread
Susceptible=zeros(1,100);

start = round(rand()*100);

var(1) = Mat(start,:);

while(unique(unique(Susceptibles)== 1) == 1)
    list = find(temp == 1);
    for i=1:length(list)
        Susceptible(list(i))=1;
        var(end+1) = Mat(list(i),:);
    end
    var(1)=[]; 
end
