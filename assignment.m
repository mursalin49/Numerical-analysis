% Define the differential equation
function dT = diff_eq(t, T)
    dT = -0.02 * (3 * t^4 - 2 * t^3 + 4 * t^2 - 200);
end

% Plot the differential equation
t_values = linspace(0, 100 + 23, 1000);
T_values = arrayfun(@(t) diff_eq(t, 0), t_values);

figure;
plot(t_values, T_values, 'LineWidth', 2);
xlabel('t');
ylabel('\theta');
title('Differential Equation: d\theta/dt = -0.02(3t^4 - 2t^3 + 4t^2 - 200)');
grid on;

% Euler's method
function result = euler_method(diff_eq, t0, T0, h, end_time)
    t = t0;
    T = T0;
    result = [t, T];

    while t < end_time
        T = T + h * diff_eq(t, T);
        t = t + h;
        result = [result; t, T];
    end
end

% Calculate temperatures using Euler's method for different step sizes
t_end = 100;
h_values = [50, 25, 10];

figure;

for h = h_values
    result = euler_method(@diff_eq, 0, 500, h, t_end);

    subplot(2, 2, find(h_values == h));
    plot(result(:, 1), result(:, 2), 'o-', 'LineWidth', 1.5);
    xlabel('t');
    ylabel('\theta');
    title(['Euler''s Method (h = ' num2str(h) ')']);
    grid on;
end

subplot(2, 2, 4);
legend('h = 50', 'h = 25', 'h = 10');
