clc 
clear all
close all

file=fopen('THERMO.dat','r');
fgetl(file);
temp_data=fgetl(file);
t=strsplit(temp_data,' ');
temp_gl=str2double(t{2});
temp_gm=str2double(t{3});
temp_gh=str2double(t{4});

for i=1:3
    fgetl(file);
end
m=ftell(file);

c=0;
while ~feof(file)
    tline = fgetl(file);
    x=tline(1:3);
    y='END';
    if x==y
        break
    end    
    
    c=c+1;
end

nos=(c)/4;
fseek(file,m,'bof');


for i=1:nos
     
     [temp,coeff,compound]=parser(file);
     disp(i)
     disp(compound)
     
end









