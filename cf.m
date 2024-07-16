cp_data=load('data');    
temp=cp_data(:,1);       
cp=cp_data(:,2);    



hold on
[curvefit,gof] = fit(temp,cp,'poly3','Normalize','on');
plot(temp,cp,'linewidth',2)
plot(curvefit,temp,cp)
%plot(curvefit,temp,cp,'Residuals')

     aTable = struct2table(gof); 
     disp(aTable);
     curvefit