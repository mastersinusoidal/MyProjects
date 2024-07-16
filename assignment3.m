%------------------------Gaurav Joshi GWT-1840360--------------------------
clear all                                          % Clears command history
close all                                          % Closes  all windows
clc                                                % Clears command window
%% ========================================================================
A=[3 1 1 1;-1 4 1 2;-1 -1 3 0;1 -1 -1 6];
B=[4 5 -3 7]';
As=[A,B];
x=[4 3 2 1]';
n=4;
err=zeros(n,1);
it=0;
for iter=1:20
    for k=1:n
        xold=x(k);
        num=As(k,end)-As(k,1:k-1)*x(1:k-1)-As(k,k+1:n)*x(k+1:n);
        x(k)=num/As(k,k)
        
        err(k)=abs(x(k)-xold);
    end 
    it=it+1
end    

A=[1 1 1;3 4 7 ; 0 -1 1]
B=[50000 265000 10000]'
x=A\B
        
