%%%%%%%%%%%%%%%%%%%%%%% PLOT 1 %%%%%%%%%%%%%%%%%%%%%%
% clear
% count =1;
% colorcode=['m','r','b','g','c','k','y'];
% rate = 0.3;
% stages=4;
% i=1:stages;
% x(i)=rate.^i;
% ga= 0:0.1:1;
% plot(ga,(1-ga) / (7) ,colorcode(1))
% for i = 2: stages
%     temp = 1+sum(x(1:i));
%     hold on;
%     plot(ga,(1-temp*ga) / (temp*7) ,colorcode(i))
%     axis([0 1 0 0.15])
% end

%%%%%%%%%%%%%%%%%%%%%%%%% PLOT 2 %%%%%%%%%%%%%%%%%%%%%

% clear
% k=6;
% colorcode=['m','r','b','g','c','k','y'];
% a=1;
% %for x=1:2
% g = -0.2;
% j = -0.2;
% for level=1:6
% L=0.01;
% g=g+0.2;
% j=j+0.2;
% for i = 1:100 
% %rho(i) = (-(g + g*j + a*k*l - a*g*k*l) + sqrt(4*a*g*k*l*(1-a*(g*j+k*l)) +(a*k*l + g*(1+j-a*k*l))^2) ) / (2*a*g*k*l);
% rho(i) = (-(-k*a*g*L+k*a*L+g*j+g) + sqrt( (-k*a*g*L+k*a*L+g*j+g)^2 - 4*k*a*g*L*(-g*j*a-k*a*L+1)) )/(2*k*a*g*L);
%  v (i) = (g*rho(i))/(1+rho(i)*g);
% L=L+0.01;
% end
% hold on;
% %subplot(2,5,(x-1)*5+level),
% plot(0:0.01:0.99,rho,colorcode(level));
% %hold on;
% %subplot(2,5,(x-1)*5+level),plot(0:0.01:0.99,v);
% axis([0 1 0 1])
% end
% a=1.4710;
% %end
%%%%%%%%%%%%%%%%%%%%%%%%% PLOT 3 %%%%%%%%%%%%%%%%%%%%%%
% clear
% prod =0.0;
% colorcode=['m','r','b','g','c','k','y'];
% for medium =1:4
% prod =prod + 0.3*0.3;
% i=1;
% for rate = 0:0.01:1
%     a=1+rate^1+rate^2+rate^3+rate^4+rate^5+rate^6+rate^7+rate^8;
%     la(i)=(1-a*(prod))/(a*6);
%     i=i+1;
% end
% hold on
% subplot(2,2,4),plot(0.:0.01:1,la(:),colorcode(medium));
% axis([0 1 0 0.2])
% end
%%%%%%%%%%%%%%%%%%%%%%%% PLOT 4 %%%%%%%%%%%%%%%%%%%%%%
clear
avK = 10;
avK2 = 232;
count =1;
colorcode=['m','r','b','g','c','k','y'];
rate = 0.45;
stages=4;
i=1:stages;
x(i)=rate.^i;
i=0;
ga= 0:0.01:1;
%plot(ga,(1-ga) / (7) ,colorcode(1))
for i = 0: stages
    temp = 1+sum(x(1:i))
    hold on;
    deno = (( (ga*temp*(avK^2 - avK2))+ avK2)*temp)
 plot(ga(:), ((1-ga*temp)*avK)./deno,colorcode(i+1))
  %axis([0 1 0 1])
end
