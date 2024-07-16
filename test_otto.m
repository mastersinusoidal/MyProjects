clear all 
close all
clc 

%-------------------------Input------------------------------
t3=2300;
gamma=1.4;
l2=5;
l3=25;
e=3;

%------------------State variables---------------------------

p1=10325;
t1=500;
%-----------------Engine parameters--------------------------
bore=0.1;
stroke=0.1;
conrod=0.15;
cr=12;

t = 0:2;

ang_speed = 1;
theta = ang_speed*t;

%-------------------------------------------------------------
v_swept=(pi/4)*bore^2*stroke;
v_clearance=v_swept/(cr-1);


v1=v_swept+v_clearance;

v2=v_clearance;
p2=p1*cr^gamma;
t2=p2*v2*t1/(p1*v1);

constant_c=p1*v1^gamma;
[v_compression]=piston_kinematics(bore,stroke,conrod,cr,180,0);
[p_compression]=constant_c./v_compression.^gamma;

v3=v2;
p3=p2*t3/t2;
t3=p3*v3*t2/(p2*v2);

constant_c=p3*v3^gamma;
[v_expansion]=piston_kinematics(bore,stroke,conrod,cr,0,180);
[p_expansion]=constant_c./v_expansion.^gamma;

v4=v1;
p4=p3*(v3/v4)^gamma;
t4=p4*v4*t3/(p3*v3);
ani = subplot(1,2,1);
 for theta=0:2:720
     
theta31=(acosd((1/l3)*sqrt((l3)^2-(e+l2*sind(theta)^2))));
    s=plot([0,l2*sind(theta)],...
            [0,l2*cosd(theta)],...
            [-3,-3],[-70,70],...
            [l2*sind(theta),-e],...
            [l2*cosd(theta),l2*cosd(theta)+l3*cosd(theta31)],...
            'o-','linewidth',5);
    
     s(1).Marker='o';
     s(1).MarkerSize=6;
     s(2).LineWidth=1;
     s(2).LineStyle='--';
     s(2).Color='k';
     s(3).MarkerFaceColor='r';
     s(3).MarkerSize=5;
    
    axis(gca,'equal');
     axis([-20,15,-8,35]);
     title('Piston Motion');
   
     pause(0.0003)

    if theta<length(t)
         vel = subplot(1,2,2);
         delete(s);
         for i=1:length(t)
   
   
   
   
    xlabel('Volume (m^3)');
    ylabel('Pressure (N/m^2)');
    title('Otto Cycle');
    axis([0,0.0009,-50000,650000]);
   curve1=animatedline('color','c','linewidth',2);
   for i=p1:p1
     a=linspace(v1,v2,100);
     b=linspace(p1,p1,100);
     
    
    for j=length(a):-1:1
        x=a(j);
        y=b(j);
        addpoints(curve1,x,y);
        pause(0.01) ;  
    end
  
end
text(v2,p1-10000,'Intake\rightarrow','color','c');
 curve2=animatedline('color','r','linewidth',2);
for i=0:v_compression
   
    for j=1:100
         x= v_compression(j);
         y= p_compression(j);
         addpoints(curve2,x,y);
         pause(0.01) ;  
    end
  
end
text(v_compression(100),p_compression(65),'Compression Stroke \rightarrow','color','r')
curve3=animatedline('color','g','linewidth',2);
 for j=v2:v3
      a=linspace(v2,v3,100);
      b=linspace(p2,p3,100);
     
    for j=1:length(a)
        x=a(j);
        y=b(j);
        addpoints(curve3,x,y);
        pause(0.01) ;
    end
   
end
text(v3+0.000005,((p2+p3)/2),'\leftarrow Heat Addition at Cv','color','g')
curve4=animatedline('color','y','linewidth',2);
for j=0:v_expansion
     
    for j=1:100
        x= v_expansion(j);
        y= p_expansion(j);
        addpoints(curve4,x,y);
        pause(0.01) ;
    end
   
end
text(v_expansion(30),p_expansion(28),'\leftarrow Power Stroke','color','y')
 curve5=animatedline('color','b','linewidth',2);
for j=v4:v1
      a=linspace(v4,v1,100);
      b=linspace(p4,p1,100);
     
   for j=1:length(a)
        x= a(j);
        y= b(j);
        addpoints(curve5,x,y);
        pause(0.01) ;
   end
  
end
    text((v1),((p1+p4)/2),'\leftarrow Heat Rejection at Cv ','color','b')
    curve6=animatedline('color',[1,0,1,0.7],'linewidth',2);
for i=p1:p1
     a=linspace(v1,v2,100);
     b=linspace(p1,p1,100);
     
    for j=1:length(a)
        x=a(j);
        y=b(j);
        addpoints(curve6,x,y);
        pause(0.01) ;  
    end
  
end
text(a(15),b(2)-10000,'\leftarrow Exhaust','color','m');


    legend('Intake Stroke','Adiabatic Compression','Heat Addition',...
        'Adiabatic Expansion','Heat Rejection','Exhaust Stroke')
    
    theff=(1-((t4-t1)/(t3-t2)))*100;
    str = ['Thermal Efficiency=',num2str(theff),'%'];
    dim = [0.3 0.2 0.3 0.3];
    annotation('textbox',dim,'String',str,'FitBoxToText','on');
    pause(0.005);
     
     

 end
     
 end
    
    
    
    
end 
