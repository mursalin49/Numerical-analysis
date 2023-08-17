y= @(x) x^3 -(0.165*x^2)+(3.9993*10^-4);

x0 = input("Enter first guess: " );
x1 = input("Enter second guess: " );
max_iterations = input("Enter max iterations: " );
tolerance = input("Enter tolerance: " );

iterations = 0;

while iterations < max_iterations
    iterations = iterations + 1;

x2=x1-(y(x1)*(x1-x0))/(y(x1)-y(x0));

    relative_approximate_error = abs((x2-x1)/x2);
    if relative_approximate_error < tolerance
      break;
    endif

   x0=x1;
   x1=x2;
    
endwhile
fprintf("No of iterations: %d \n", iterations);
fprintf("Root: %d \n", x2);