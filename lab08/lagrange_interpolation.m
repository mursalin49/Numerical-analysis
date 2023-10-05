x=[15,20];
y=[362.78,517.35];
t=16;
 n = length(x);
 result = 0;
 for i=1:n;
   term=y(i);
   for j=1:n;
     if(i!=j)
     term=term*(t-x(j))/(x(i)-x(j));
     end
   end
   
  result=result+term;
  
   
 end
 disp(result);