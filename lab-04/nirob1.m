function [root,iterations,errors] =nirob1(guess1,guess2,max_iterations,tolerance)
  if functionDemo(guess1)*functionDemo(guess2) >=0
    error("The guess does not satisfy the required conditions");
  endif
  iterations = 0;
  errors = [];
  preGuess = 0;
  while iterations <max_iterations
     c=(guess1+guess2)/2;
    if functionDemo(guess1)*functionDemo(guess2)<0
      guess2=c;
    else
      guess1=c;
      endif
     if iterations >1
       error = abs((c-preGuess)/c);
       preGuess = c;
       errors = [errors,error];
     else
       preGuess = c;
       endif
    iterations++;
  endwhile
    root=c;
endfunction
