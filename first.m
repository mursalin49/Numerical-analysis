% Define the differential equation
f = @(x, y) -0.02 * (3 * x^4 - 2 * x^3 + 4 * x^2 - 200);

% Time span
tspan = [0 123];

% Initial condition
theta0 = 500;

% Solve using ode45
[t_ode45, theta_ode45] = ode45(f, tspan, theta0);

% Plot ode45 results
figure;
plot(t_ode45, theta_ode45, 'b-', 'LineWidth', 1);
hold on;

% Euler's method
x0 = 0;
y0 = theta0;
x_end = 123;

step_sizes = [50, 25, 10];

for h = step_sizes
    x = x0;
    y = y0;

    results = [x, y];

    while x < x_end
        slope = f(x, y);
        y = y + h * slope;
        x = x + h;
        results = [results; x, y];
    end

    % Plot Euler's method results
    plot(results(:, 1), results(:, 2), 'o-', 'LineWidth', 1.5, 'DisplayName', ['h = ' num2str(h)]);
end

xlabel('t');
ylabel('\theta');
title('Euler''s Method and ode45 Comparison');
legend('ode45', 'h = 50', 'h = 25', 'h = 10');
grid on;
hold off;

