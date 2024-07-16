clear all
close all
clc


l1=1;                  %Arm length
l2=0.5;                %Arm length
a=linspace(0,90,20);   %theta1
b=linspace(0,90,20);   %theta2
j=1;

for i=1:length(a)
    
    for k=1:length(b)
      
    
   [H0_0,H0_1,H1_2,H0_2]=forward_kinematics(a(i),b(k),l1,l2);
    x1=H0_0(1,4);
    y1=H0_0(2,4);
    
    x2=H0_1(1,4);
    y2=H0_1(2,4);
    
    x3=H1_2(1,4);
    y3=H1_2(2,4);
    
    x4=H0_2(1,4);
    y4=H0_2(2,4);
    
    q(j)=x1;
    t(j)=x2;
    w(j)=y1;
    s(j)=y2;
    e(j)=x3;
    m(j)=x4;
    g(j)=y3;
    n(j)=y4;
    
   
   
  
   
   P=plot([q(j),t(j)],[w(j),s(j)],[t(j),m(j)],[s(j),n(j)],m,n,'--black' ,'linewidth',3)
   P(3).LineWidth=0.5;
   title ('manipulator');
   
  
   axis([-0.75 1.6 0 1.75])
   
   pause (0.03)
  
   j=j+1;
  

    end
end