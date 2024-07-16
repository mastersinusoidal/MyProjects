  for theta2=180:720 
     switch (theta2)
        case 180
            t1=text(1,1,'Adiabatic Compression');
            continue;
            
             
        case 362
           
             t2=text(1,2,'Heat Addition');
              delete(t1);
           continue;
        case 540
            
             t3=text(1,3,'Adiabatic Expansion');
              delete(t2);
             continue;
           
        case 720
             
             t4=text(1,4,'Heat Rejection');
              delete(t3);
             continue;
             
             
     end
  end