%Assignment 1 OEEC-612C

%Gaurav Joshi
%GWT-1840360

clear all                               % Clears command history
close all                               % Closes  all windows
clc                                     % Clears command window

x = linspace(0,2*pi,100);
y = sin(x);

plot(x,y)
grid on                                 %for major grid
grid minor                              %for minor grid



xlabel('x')
ylabel('sin(x)')
title('Plot of the Sine Function')


figure(2)
subplot(2,2,1)
plot(x,sin(x))
xlabel('x')
ylabel('sin(x)')


subplot(2,2,2)
plot(x,sin(2*x))
xlabel('x')
ylabel('sin(2x)')


subplot(2,2,3)
plot(x,sin(3*x))
xlabel('x')
ylabel('sin(3x)')


subplot(2,2,4)
plot(x,sin(4*x))
xlabel('x')
ylabel('sin(4x)')


