%Function to find Homogeneous Transformation matrix Using Denvait
%-Hartenberg method




%theta1=input('theta1')
%theta2=input('theta2')
%l1=input('l1')
%l2=input('l2')


function [H0_0, H0_1, H1_2, H0_2 ]=forward_kinematics(theta1,theta2,l1,l2)
 function [T]=DHC(theta,alpha,r,d)
T=[ cosd(theta) -sind(theta)*cosd(alpha) sind(theta)*sind(alpha) r*cosd(theta);
    sind(theta) cosd(theta)*cosd(alpha)  cosd(theta)*sind(alpha) r*sind(theta);
    0           sind(alpha)              cosd(alpha)             d            ;
    0           0                        0                       1            ];   



H0_0=[1 0 0 0;
      0 1 0 0;
      0 0 1 0;
      0 0 0 1];
  H0_1=DHC(theta1,90,0,l1);
  H1_2=DHC(theta2,0,l2,0);
  H0_2= H0_0*H0_1*H1_2
  disp H0_2
end

end