power_BuckBoostConverterclear all                               % Clears command history
close all                               % Closes  all windows
clc                                     % Clears command window

syms V p s
n=3;                                    %no. of phases
R1=0.2;                                 %stator resistance (ohm)
R2=0.2;                                 %rotor resistance wrt stator (ohm)
X1=0.1;                                 %stator reactance (ohm)
X2=0.1;                                 %rotor reactance wrt stator (ohm)
f=50;                                   %rated frequency
f_half=25;                              %half frequency
w_ms=(4.*pi.*f)./p;                     %synchronous speed at rated frequency
w_ms_half=(4.*pi.*f_half)./p;           %synchronous speed at half frequency

T=3./w_ms.*(((V.^2.*R2)./s)/((R1+(R2./s)).^2 +(X1+X2)^2));
T_half=3./w_ms_half*(((V^2*R2)/s)/((R1+(R2/s))^2 +(X1+X2)^2));
Ratio=T/T_half