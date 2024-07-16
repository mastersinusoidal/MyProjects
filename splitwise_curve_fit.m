clear all                               % Clears command history
close all                               % Closes  all windows
clc                                     % Clears command window


%% ========================Preparing the Data==============================
cp_data=load('data');    
temp=cp_data(:,1);       
cp=cp_data(:,2);    

temp1=cp_data(1:499,1);
cp1=cp_data(1:499,2);

temp2=cp_data(500:1100,1);
cp2=cp_data(500:1100,2);

temp3=cp_data(1101:2200,1);
cp3=cp_data(1101:2200,2);

temp4=cp_data(2201:3200,1);
cp4=cp_data(2201:3200,2);
%% =======================Stepwise Regression==============================
figure('WindowState','maximized')
grid on
hold on

[curvefit1,gof1] = fit(temp1,cp1,'poly3','Normalize','on');
a=plot(curvefit1,temp1,cp1);
set(a,'LineWidth',2,'color','blue');

[curvefit2,gof2] = fit(temp2,cp2,'poly3','Normalize','on');
b=plot(curvefit2,temp2,cp2);
set(b,'LineWidth',2,'color','green');

[curvefit3,gof3] = fit(temp3,cp3,'poly1','Normalize','on');
c=plot(curvefit3,temp3,cp3);
set(c,'LineWidth',2,'color','yellow');

[curvefit4,gof4] = fit(temp4,cp4,'poly1','Normalize','on');
d=plot(curvefit4,temp4,cp4);
set(d,'LineWidth',2,'color','black');
%% =================Goodness Parameter's Table=============================
aTable = struct2table(gof1);
bTable = struct2table(gof2);
cTable = struct2table(gof3);
dTable = struct2table(gof3);
T=table([aTable;bTable;cTable;dTable]);
disp(T);
%% ========================================================================
legend('DataPoints','Cubic Fit (1)',...
    'DataPoints','Cubic Fit (2)',...
    'DataPoints','Linear Fit (3)',...
    'DataPoints','Linear Fit (4)','Location','SouthEast')
xlabel('Temperature  (K)')
ylabel('Cp  (KJ/Kmol-K)')
title('Splitwise Curve Fitting')
%% ===============Displaying the mathematical model======================== 
disp(curvefit1);
disp(curvefit2);
disp(curvefit3);
disp(curvefit4);

