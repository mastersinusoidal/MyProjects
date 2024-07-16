
close all
clc

figure(1)

hold on
plot([0.34,0.49,0.61],[24.2,39.4,45.8],'*','color','red','MarkerSize',10)
plot([0.34,0.49,0.61],[10.2,22.4,23.1],'.','color','blue','MarkerSize',20)
plot([0.34,0.49,0.61],[24.2,39.4,45.8],'-.k')
plot([0.34,0.49,0.61],[10.2,22.4,23.1],'-.k')

legend('Actual Vertical Displacement (mm)','Predicted Vertical Displacement (mm)','Location','northwest')
xlabel('Heat Input (KJ/mm)')
ylabel('Vertical displacement (mm)')


figure (2)
hold on

bar([0.34,0.49,0.61],[0.05,0.17,0.26])

plot(fittedmodel,'--k')




xlabel('Heat Input (KJ/mm)')
ylabel('Angular distortion (rad)')



