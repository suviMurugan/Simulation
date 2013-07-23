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
 
colorcode=['y','m','c','r','g','b','k'];

for i=1:iteration
    rateVector(1)=infectRate*population(1)*(1-population(1))
    rate = rateMatrixGen(rateVector);
    temp=population;
    population = population * rate;
    hold on;
    for j = 1:length(population) 
        plot([i-1 i],[temp(j) population(j)],colorcode(j));
    end
end
hold off
