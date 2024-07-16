%This function draws the PV diagram and calculates thermal efficiency

function air_cycle(v1,v2,v3,v4,v_compression,v_expansion,...
                        p1,p2,p3,p4,p_compression,p_expansion,t1,t2,t3,t4)
   
    
    
for i=p1:p1
     a=linspace(v1,v2,100);
     b=linspace(p1,p1,100);
     
    curve=animatedline('color','c','linewidth',2);
    for j=length(a):-1:1
        x=a(j);
        y=b(j);
        addpoints(curve,x,y);
        pause(0.01) ;  
    end
  
end
text(v2,p1-10000,'Intake\rightarrow','color','c');

for i=0:v_compression
    curve=animatedline('color','r','linewidth',2);
    for j=1:100
         x= v_compression(j);
         y= p_compression(j);
         addpoints(curve,x,y);
         pause(0.01) ;  
    end
  
end
text(v_compression(100),p_compression(65),'Compression Stroke \rightarrow','color','r')
 for j=v2:v3
      a=linspace(v2,v3,100);
      b=linspace(p2,p3,100);
     curve=animatedline('color','g','linewidth',2);
    for j=1:length(a)
        x=a(j);
        y=b(j);
        addpoints(curve,x,y);
        pause(0.01) ;
    end
   
end
text(v3+0.000005,((p2+p3)/2),'\leftarrow Heat Addition at Cv','color','g')

for j=0:v_expansion
     curve=animatedline('color','y','linewidth',2);
    for j=1:100
        x= v_expansion(j);
        y= p_expansion(j);
        addpoints(curve,x,y);
        pause(0.01) ;
    end
   
end
text(v_expansion(30),p_expansion(28),'\leftarrow Power Stroke','color','y')
for j=v4:v1
      a=linspace(v4,v1,100);
      b=linspace(p4,p1,100);
      curve=animatedline('color','b','linewidth',2);
   for j=1:length(a)
        x= a(j);
        y= b(j);
        addpoints(curve,x,y);
        pause(0.01) ;
   end
  
end
    text((v1),((p1+p4)/2),'\leftarrow Heat Rejection at Cv ','color','b') 
for i=p1:p1
     a=linspace(v1,v2,100);
     b=linspace(p1,p1,100);
     curve=animatedline('color',[1,0,1,0.7],'linewidth',2);
    for j=1:length(a)
        x=a(j);
        y=b(j);
        addpoints(curve,x,y);
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
    
   
end