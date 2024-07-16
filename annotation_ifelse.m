 s=subplot(1,2,2);  
    if theta2<180
      str = ('Intake');
    dim = [0.7 0.1 0.3 0.3];
    annotation('textbox',dim,'String',str,'FitBoxToText','on','color','g');  
  
   elseif theta2<390
       
    delete(findall(gcf,'type','annotation'))
    str = ('Heat Addition');
    dim = [0.7 0.1 0.3 0.3];
    annotation('textbox',dim,'String',str,'FitBoxToText','on','color','g');             
   elseif theta2<540
       
    delete(findall(gcf,'type','annotation'))
    str = ('Adiabatic Expansion');
    dim = [0.7 0.1 0.3 0.3];
    annotation('textbox',dim,'String',str,'FitBoxToText','on','color','y');        
   elseif theta2<720
       
    delete(findall(gcf,'type','annotation'))
    str = ('Heat Rejection');
    dim = [0.7 0.1 0.3 0.3];
    annotation('textbox',dim,'String',str,'FitBoxToText','on','color','b'); 
    end
    