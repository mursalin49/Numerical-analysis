y= @(x) x^3 -(0.165*x^2)+(3.9993*10^-4);

guess1 = input("Enter first guess: " );
guess2 = input("Enter second guess: " );
max_iterations = input("Enter max iterations: " );
tolerance = input("Enter tolerance: " );

iterations = 0;
errors = [];
prevGuess = 0;

while iterations < max_iterations
    iterations = iterations + 1;

    newGuess = (guess2*y(guess1)-guess1*y(guess2))/(y(guess1)-y(guess2));
    if y(newGuess) == 0
        root = newGuess;
        break;
    elseif y(newGuess) * y(guess1) < 0
        guess2 = newGuess;
    else
        guess1 = newGuess;
    endif

    if iterations > 1
        relative_error = abs(newGuess - prevGuess) / newGuess;
        errors = [errors, relative_error];
        if relative_error < tolerance
          root = newGuess;
          break;
        endif
    endif

    prevGuess=newGuess;
endwhile
fprintf("No of iterations: %d \n",iterations);
fprintf("Root: %d \n",root);
plot([1:1:length(errors)],errors);