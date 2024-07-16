%% Stalagmite test function
function [f]= stalagmite(input)
x=input(1);          
y=input(2);

f1_x=(sin(5.1*pi*x+0.5))^6;
f1_y=(sin(5.1*pi*y+0.5))^6;

f2_x=exp((-4*log(2))*((x-0.0667)^2/0.64));
f2_y=exp((-4*log(2))*((y-0.0667)^2/0.64));

f=f1_x*f1_y*f2_x*f2_y;

end
