function Runge_Kutta_4
i=1;
h = 0.2;                                                            %time step value.
t(i) = 0;                                                           %Initial time instance of the plot.
w(i) = 0.01;                                                        %Initial value of the function to be plotted.
fprintf('Step 0: t = %12.8f, w = %12.8f\n', t(i), w(i));
for i=1:100                                                         %Iteration for 100 times
    plot(t(i),w(i));                                                %Plot the point in every instance.
    hold on;
    k1 = h*Infect(t(i),w(i));
    k2 = h*Infect(t(i)+h/2, w(i)+k1/2);
    k3 = h*Infect(t(i)+h/2, w(i)+k2/2);
    k4 = h*Infect(t(i)+h, w(i)+k3);
    w(i+1) = w(i) + (k1+2*k2+2*k3+k4)/6;                            % the final value for the next instance calculated.
    t(i+1) = t(i) + h;
    fprintf('Step %d: t = %6.4f, w = %18.15f\n', i, t(i+1), w(i+1));
end
%%%%%%%%%%%%%%%%%%
function v = Infect(t,I)
    v = 2*I + t;                                                    %can add any function to be plotted.
