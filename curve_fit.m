clear all                               % Clears command history
close all                               % Closes  all windows
clc                                     % Clears command window
%% ===============================DATA=====================================
cp_data=load('data');    
temp=cp_data(:,1);       
cp=cp_data(:,2);    
%% ===========================Linear Fit===================================
a=polyfit(temp,cp,1);
new_cp1=polyval(a,temp);
%% ==========================Cubic Fit=====================================
b=polyfit(temp,cp,3);
new_cp3=polyval(b,temp);
figure('WindowState','maximized')
%% ======================Linear Fit Curve==================================
subplot(2,2,2)
hold on
grid on
plot(temp,cp)
plot(temp,new_cp1,'linewidth',2)
legend('Data Points','Linear Fit')
xlabel('Temperature  (K)')
ylabel('Cp  (KJ/Kmol-K)')
title('Linear Fit Curve')
%% =======================Cubic Fit Curve==================================
subplot(2,2,4)
hold on
grid on
plot(temp,cp,'linewidth',2)
plot(temp,new_cp3,'linewidth',2)%
legend('Data Points','Cubic Fit')
xlabel('Temperature  (K)')
ylabel('Cp  (KJ/Kmol-K)')
title('Cubic Fit Curve')
%% ================== Cubic Fit Vs Linear Fit==============================
subplot(1,2,1)
hold on
grid on
plot(temp,cp,'linewidth',2)
plot(temp,new_cp1,'linewidth',2)
plot(temp,new_cp3,'linewidth',2)
legend('Data Values','Linear Fit','Cubic Fit')
xlabel('Temperature(K)')
ylabel('Cp(KJ/Kmol-K)')
title('Cubic Fit Vs Linear Fit')