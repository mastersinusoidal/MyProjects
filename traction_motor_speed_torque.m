clear all                               % Clears command history
close all                               % Closes  all windows
clc                                     % Clears command window

%% motor and controller parameters
vol_arm=72;                             %rated armature voltage
curr_arm=72;                            %rated armature current
Ra=0.5;                                 %armature resistance
k_phi=0.7;                              %motor constant
d=0.7;                                  %duty cycle
vol_ac=vol_arm*d;                       %actual voltage
w=0:0.01:100;                           %angular velocity
% vehicle's speed torque characteristics
Tv=24.7+0.0051.*w.^2;
% motor's speed torque characteristics
Tm=(vol_ac.*k_phi)/Ra-((k_phi).^2/Ra).*w;

%% plotting
plot(w,Tm)
hold on
plot(w,Tv)
xlabel("Speed(rad/sec)")
ylabel("Torque(Nm)")
title('Steady state speed of EV at 70% duty ratio')
legend('Motor','Vehicle')

