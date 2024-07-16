%% ==================Stalagmite objective function=========================
function [Y]= stalagmite(X)
x=X(1);                                                         %Variable 1      
y=X(2);                                                         %Variable 2

f1x= sin(5.1.*pi.*x+0.5).^6;
f1y= sin(5.1.*pi.*y+0.5).^6;

f2x= exp((-4.*log(2)).*((x-0.0667).^2/0.64));
f2y= exp((-4.*log(2)).*((y-0.0667).^2/0.64));

f=(f1x*f1y*f2x*f2y);
Y=-f;                               %Minus sign is added to evaluate MAXIMA

end
%==========================================================================