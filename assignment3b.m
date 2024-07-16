%------------------------Gaurav Joshi GWT-1840360--------------------------
clear all                                          % Clears command history
close all                                          % Closes  all windows
clc                                                % Clears command window
%%
x = -1:0.1:1;
y1 = sinh(x);
y2 = cosh(x);
y3 = tanh(x);

figure('Name','Gaurav Joshi GWT-1840360 ')
hold on 

plot(x,y1,'r')
plot(x,x,'*','color','green')
plot(x,y2,'--k')
plot(x,y3,'o','color','blue')
grid on
title('Hyberbolic Function')
legend('sinh','x','cosh','tanh')
xlabel('x')
ylabel('f(x)')
