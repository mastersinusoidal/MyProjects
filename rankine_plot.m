function []=rankine_plot(p1,p2,p3,p4,)
t= linspace(1,t1,5000);

figure(1)
hold on
sl=zeros;
sv=zeros;
hl=zeros;
hv=zeros;
for i=1:length(t)
    sl(i)=XSteam('sL_T',t(i));
    sv(i)=XSteam('sV_T',t(i));
    hl(i)=XSteam('hL_T',t(i));
    hv(i)=XSteam('hV_T',t(i));
   
end 

plot([s1 s2],[t1 t2],'linewidth',2)
plot([s2 sg2],[t2 tsat2],'linewidth',2)
plot([sg2 s3],[tsat2 t3],'linewidth',2)
plot([s3 s4],[t3 t4],'linewidth',2)
plot([s4 sf1],[t4 tsat1],'linewidth',2)
plot([sf1 sg1],[tsat1 tsat1],'linewidth',2)
plot([sg1 s1],[tsat1 t1],'linewidth',2)
plot(sl,t,'--r','linewidth',1)
plot(sv,t,'--r','linewidth',1)
xlabel({'Specific Entropy [S] ','(kJ/kg K)'},'FontWeight','bold')
ylabel({'Temperature [T] ','(Deg C)'},'FontWeight','bold')

figure(2)
hold on
plot([s1 s2],[h1 h2],'linewidth',2)
plot([s2 sg2],[h2 hg2],'linewidth',2)
plot([sg2 s3],[hg2 h3],'linewidth',2)
plot([s3 s4],[h3 h4],'linewidth',2)
plot([s4 sf1],[h4 hf1],'linewidth',2)
plot([sf1 sg1],[hf1 hg1],'linewidth',2)
plot([sg1 s1],[hg1 h1],'linewidth',2)
plot([sl sv],[hl hv],'--r','linewidth',1)

xlabel({'Specific Entropy [S] ','(kJ/kg K)'},'FontWeight','bold')
ylabel({'Specific Enthalpy [H] ' ,'(kJ/kg)'},'FontWeight','bold')




end

