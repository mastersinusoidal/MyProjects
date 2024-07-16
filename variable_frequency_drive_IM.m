clear all                               % Clears command history
close all                               % Closes  all windows
clc                                     % Clears command window

V=230;                                  %supply voltage
V_p=230/sqrt(3);                        %per phase voltage
n=3;                                    %no. of phases
p=4;                                    %no. of poles
R1=0.2;                                 %stator resistance (ohm)
R2=0.2;                                 %rotor resistance wrt stator (ohm)
X1=0.1;                               %stator reactance (ohm)
X2=0.1;                               %rotor reactance wrt stator (ohm)
f=linspace(10,50,10);                   %frequency
%% ------------------------------------------------------------------------ 
for i=1:10
    w_ms=(4.*pi.*f(i))./p;              %synchronous speed (rps)
    for j=1:200
        s(j)=j/200;                     %slip
        w_m(j)=(1-s(j))*w_ms;           %rotor speed
        T(j)=3./w_ms.*(((V_p.^2.*R2)./s(j))./((R1+(R2./s(j))).^2 +(X1+X2).^2));     %torque developed in rotor
    end
    hold on 
    plot (w_m,T)
    grid on  
end
    xlabel('Speed (rad/sec)')
    ylabel('Torque (Nm)')
    title('Speed-Torque characteristics for VFD')
    legend('10.0 Hz','14.4 Hz','18.8 Hz','23.3 Hz','27.7 Hz','32.2 Hz','36.6 Hz','41.1 Hz','45.5 Hz','50.0 Hz')
