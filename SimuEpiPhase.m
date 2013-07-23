
function population=SimuEpiPhase(population,rateVector,iteration)

%The program is done to simulate the epidemics with phases of infection
%Population is the initial population vector given by the user in each
%compartment starting from susceptible,Infective Phase 1,2...

%rateVector is the rate of leaving the state corresponding to it in index 
%in population vector.

 if nargin < 3
    iteration = 100;
 end
 infectRate=rateVector(1);
 
for i=1:iteration
    rateVector(1)=infectRate*population(1)*(1-population(1))
    rate = rateMatrixGen(rateVector);
    temp=population;
    population = population * rate;
    hold on;
    %for j = 1:length(population) 
    plot([i-1 i],[temp(1) population(1)], 'g');
    plot([i-1 i],[temp(2) population(2)], 'r');
    plot([i-1 i],[temp(3) population(3)], 'm');
    plot([i-1 i],[temp(4) population(4)], 'b');
    plot([i-1 i],[temp(5) population(5)], 'y');
end
hold off
