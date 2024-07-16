%Forward Kinematics of a 2R Robotic Arm Manipulator

close all
clear all
clc

%--------------------------Initialization------------------------------
l1=1;                  %Arm length for link 1
l2=0.5;                %Arm length for link 2
a=linspace(0,90,35);   %theta1 (angle between link 1 and ground frame)
b=linspace(0,90,35);   %theta2 (angle between link 1 and link 2)
j=1;                   %counter looping variable for plotting
v=1;                   %variable for recording movie frames
w=1;                   %variable to track end effector position
%----------------------------------------------------------------------
%Using Denavit-Hartenberg Homogenous Transfrom for finding the end-effector
%position

for i=1:length(a)
    
for k=1:length(b)
      
    
   [H0_0,H0_1,H1_2,H0_2]=forward_kinematics(a(i),b(k),l1,l2);  %call to the user made function "forward_kinematics.m"
   
   %Extracting the position of displacement vectors from the homogenous
   %transformation matrix--------------------------------------------------
    x1=H0_0(1,4);        %x coordinate of base frame.
    y1=H0_0(2,4);        %y coordinate of base frame.
    
    x2=H0_1(1,4);        %x coordinate of 1st joint wrt base frame.
    y2=H0_1(2,4);        %y coordinate of 1st joint wrt base frame.
    
    x3=H1_2(1,4);        %x coordinate of 2nd joint wrt 1st joint.
    y3=H1_2(2,4);        %y coordinate of 2nd joint wrt 1st joint.
    
    x4=H0_2(1,4);        %x coordinate of 2nd joint wrt base frame.
    y4=H0_2(2,4);        %y coordinate of 2nd joint wrt base frame.
    
    q(j)=x1;
    t(j)=x2;
    w(j)=y1;
    s(j)=y2;
    e(j)=x3;
    m(j)=x4;
    g(j)=y3;
    n(j)=y4;
%---------------------------------------plotting------------------------------------------------------------
 
   P=plot([t(j),q(j)],[s(j),w(j)],[t(j),m(j)],[s(j),n(j)],m,n,'--black' ,'linewidth',3);
   P(3).LineWidth=1;
   title ('Froward Kinematics using D-H transfrom');
   xlabel('X axis');
   ylabel('Y axis');
   axis([-0.75 1.6 0 1.75]);
%-------------------------------------------------------------------------------------------------------------  
   pause (0.003);
  
   
   N(v)=getframe(gcf);
   v=v+1;
   j=j+1;
end
end

%-------Merging the frames and writing animation movie to avi format in device

