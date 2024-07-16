function [Cp,H,S]=thermo_calculator(inputs)
    
   c1=inputs(1);
   c2=inputs(2);
   c3=inputs(3);
   c4=inputs(4);
   c5=inputs(5);
   c6=inputs(6);
   c7=inputs(7);
   
   c8=inputs(8);
   c9=inputs(9);
   c10=inputs(10);
   c11=inputs(11);
   c12=inputs(12);
   c13=inputs(13);
   c14=inputs(14);
   
   temp_ll=inputs(15);
   temp_lm=inputs(16);
   temp_lh=inputs(17);
   T=temp_ll:temp_lh;
   R = 8.314;                %J/mol·K
    if T >temp_lm
        Cp =(c1 + c2*T + c3*T.^2 + c4*T.^3 +c5*T.^4).*R;
        H = (c1 + c2*(T./2) + c3*(T.^2./3) + c4*(T.^3./4) + c5*(T.^4./5) +c6./T).*(R*T);
        S = (c1*log(T) + c2*T + c3*(T.^2./2) + c4*(T.^3./3) + c5*(T.^4./4 + c7).*R );
    else 
        Cp =(c8 + c9*T + c10*T.^2 + c11*T.^3 +c12*T.^4).*R;
        H = (c8 + c9*(T./2) + c10*(T.^2./3) + c11*(T.^3./4) + c12*(T.^4./5) +c13./T).*(R*T);
        S = (c8*log(T) + c9*T + c10*(T.^2./2) + c11*(T.^3./3) + c12*(T.^4./4 + c14)).*R ;
    end
    
end