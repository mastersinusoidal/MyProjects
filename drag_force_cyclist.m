%Program to calculate drag force against a cyclist and plot graphs between 
%(Velocity vs Drag force) & (Drag coefficient vs Drag force)

clear all
close all
clc

%---------------------------INPUTS---------------------------------
cd=0.700;        %Drag Coeffecient (dimensionless)
a=0.300;         %Frontal area of cyclist(in m^2)
rho=1.2;         %density (in kg/m^3)
v=[1:50];        %velocity of cyclist(in m/s)
%------------------------------------------------------------------

df=0.5*rho*a*v.^2*cd;      %Drag Equation

%------------------------------------------------------------------
figure('Name','DRAG FORCE VS VELOCITY','Numbertitle','off')
plot(v,df,'color','r')
xlabel("velocity (m/s)")
ylabel("Drag force (Newton)")
grid on 
%------------------------------------------------------------------

figure('Name','DRAG FORCE VS DRAG COEFFICIENT','Numbertitle','off')
coeff_drag=linspace(0.600,1.000,100);
v_=12;
df=0.5*rho*a*v_.^2.*coeff_drag;
plot(coeff_drag,df,'color','g')
xlabel("Drag Coefficient")
ylabel("Drag force (Newton)")
grid on 
%------------------------------------------------------------------




