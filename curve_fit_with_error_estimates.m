clear all                               % Clears command history
close all                               % Closes  all windows
clc                                     % Clears command window

%% =============================Inputs=====================================
cp_data=load('data');    
temp=cp_data(:,1);       
cp=cp_data(:,2);    
%% =========================Statistical Caluclations=======================
[a,S,mu]=polyfit(temp,cp,3);
fit=polyval(a,temp,S,mu);

ssr=0;
sse=0;
m=mean(cp);
for i=1:length(cp)
    
   ssr=(ssr+(fit(i)-m)^2); 
   sse=(sse+(cp(i)-fit(i))^2);
   
end

sst=sse+ssr;
R_sq=1-(sse/sst);
rmse=(sse/3200)^0.5;
%% ========================================================================
figure('WindowState','maximized')
hold on
grid on
plot(temp,cp,'linewidth',2)
plot(temp,fit,'linewidth',2)
dim = [.2 .5 .3 .3]; 
str={['R^2 = ',num2str(R_sq)],['RMSE = ', num2str(rmse)],['SSE = ', num2str(sse)]};
annotation('textbox',dim,'String',str,'FitBoxToText','on')
legend('Data Points','Curve Fit')
xlabel('Temperature  (K)')
ylabel('Cp  (KJ/Kmol-K)')
title('Temperature vs Specific heat')
