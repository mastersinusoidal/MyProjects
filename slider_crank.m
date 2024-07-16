clear all 

close all
clc


for theta2=0:1440;
    
    theta31=(acosd((1/l3)*sqrt((l3)^2-(e+l2*sind(theta2)^2))));
  
    
    P=plot([0,l2*sind(theta2)],[0,l2*cosd(theta2)],[-3,-3],[-70,70],[l2*sind(theta2),-e]...
        ,[l2*cosd(theta2),l2*cosd(theta2)+l3*cosd(theta31)],'o-','linewidth',2);
    P(1).Marker='o';
    P(1).MarkerSize=6;
    
    P(2).LineWidth=1;
    P(2).LineStyle='--';
    P(2).Color='k';
    

    axis(gca,'equal');
    axis([-20,15,-8,35]);
    pause(0.00001);
end