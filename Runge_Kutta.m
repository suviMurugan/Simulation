function Runge_Kutta_4
i=1;
h = 0.5;
t(i) = 0;
w(i) = 0.1;
fprintf('Step 0: t = %12.8f, w = %12.8f\n', t(i), w(i));
for i=1:1000
    k1 = h*Infect(t(i),w(i));
    k2 = h*Infect(t(i)+h/2, w(i)+k1/2);
    k3 = h*Infect(t(i)+h/2, w(i)+k2/2);
    k4 = h*Infect(t(i)+h, w(i)+k3);
    w(i+1) = w(i) + (k1+2*k2+2*k3+k4)/6;
    t(i+1) = t(i) + h;
    fprintf('Step %d: t = %6.4f, w = %18.15f\n', i, t(i+1), w(i+1));
end
plot(t,w);
hold on;
plot(t,1-w,'r');
%%%%%%%%%%%%%%%%%%
function v = Infect(t,I)
    v = 0.09*(1-I)  - 0.03*I ;
    
    
    
