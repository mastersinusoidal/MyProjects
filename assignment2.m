%------------------------Gaurav Joshi GWT-1840360--------------------------
clear all                                          % Clears command history
close all                                          % Closes  all windows
clc                                                % Clears command window
%% ========================================================================
syms x 
f(x) = sin(x)/x;
figure(1)
ezplot(f(x), [-30, 30,-0.3,1]);
lim=limit(f,x,0);
disp(lim);
%--------------------------------------------------------------------------

syms x y1 y2
y1=2/(sqrt(3+x^2));
figure(2)
ezplot(y1,[-20,20]);
title("Gaurav Joshi GWT/1840360");

%--------------------------------------------------------------------------
y2=-1/(sqrt(2+x^2));
figure(3)
ezplot(y2,[-20,20,-0.8,0]);
title("Gaurav Joshi GWT/1840360");


%% ========================================================================
figure(4)
[x,y] = meshgrid(-2:.2:2,-2:.2:2);
z = x^2+y^2;
surf(x,y,z)
shading interp

%% ========================================================================
x = linspace(0,10,50);
y = sin(x);
figure(5)
p=plot(x,y,'+k');
axis([0 10 -1.5 1.5]);
p.LineWidth=2;0.
p.MarkerEdgeColor='k';
p.MarkerFaceColor=[.49 1 .63];
p.MarkerSize=10;
legend('sin(x)')
xlabel('x');
ylabel('sin(x)');
text(5,0.5,' y=sin(x) \rightarrow')
text(0.5,1.3,'Sine Wave Plot','Color','blue','FontSize',14)

%% ========================================================================
X = [19.3 22.1 51.6;
     34.2 70.3 82.4;
     61.4 82.9 90.8;
     50.5 54.9 59.1;
     29.4 36.3 47.0];
figure(6)
x = sum(X);
explode=zeros(size(x));
[a,b]=max(x);
explode(b)=1;
h = pie(x,explode); 

%% ========================================================================

