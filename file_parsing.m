y=extractor
file=fopen('THERMO.dat','r');
fgetl(file);

for i=1:4
    fgetl(file);
end
p=fgetl(file);
line_1=p;
q=strsplit(line_1,'G');
r=strsplit(q{2},' ');
temp_ll=str2double(r{2});
temp_lm=str2double(r{3});
temp_lh=str2double(r{4});
temp=table(temp_ll,temp_lm,temp_lh,'VariableNames',...
    {'1','2','3'});
rows2vars(temp)
x=fgetl(file);
line_2=x;
a=strfind(line_2,'E');
c1=str2double(line_2(1:a(1)+3));
c2=str2double(line_2(a(1)+4:a(2)+3));
c3=str2double(line_2(a(2)+4:a(3)+3));
c4=str2double(line_2(a(3)+4:a(4)+3));
c5=str2double(line_2(a(4)+4:a(5)+3));
x=fgetl(file);
line_3=x;
b=strfind(line_3,'E');
c6=str2double(line_3(1:b(1)+3));
c7=str2double(line_3(b(1)+4:b(2)+3));
c8=str2double(line_3(b(2)+4:b(3)+3));
c9=str2double(line_3(b(3)+4:b(4)+3));
c10=str2double(line_3(b(4)+4:b(5)+3));
x=fgetl(file);
line_4=x;
c=strfind(line_4,'E');
c11=str2double(line_4(1:c(1)+3));
c12=str2double(line_4(c(1)+4:c(2)+3));
c13=str2double(line_4(c(2)+4:c(3)+3));
c14=str2double(line_4(c(3)+4:c(4)+3));
%end 
c={'c1' 'c2' 'c3'  'c4'  'c5'  'c6'   'c7'...
   'c8' 'c9' 'c10' 'c11' 'c12' 'c13' 'c14'};
[Values]=[c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14];
T=table(c',Values','VariableNames',{'Coefficient','Value'})
