fun= @(x)(1./(1-0.01.*x));
q=integral(fun,0,95);
fprintf('Stating time of motor =%d sec\n',q);
fprintf('Stating time of motor =%d min\n',q/60);
