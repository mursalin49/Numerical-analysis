y = @(x) (x^3)-(23*x^2)+(142*x)-120;
y1= @(x) (3*x^2)-(46*x)+142;
guess = input("Enter guess: " );
max_iterations = input("Enter max iterations: " );
tolerance = input("Enter tolerance: " );

iterations = 0;
errors = [];

while iterations < max_iterations
    iterations = iterations + 1;

    x2=guess-(y(guess)/y1(guess));

    if iterations > 1
        relative_error = abs(x2 - guess) / x2;
        errors = [errors, relative_error];
        if relative_error < tolerance
          root = x2;
          break;
        endif
    endif

    guess=x2;
endwhile
fprintf("No of iterations: %d \n",iterations);
fprintf("Root: %d \n",root);
plot([1:1:length(errors)],errors);