t = [10, 15, 20];
v = [227.04, 362.78, 517.35];
t_interpolate = 16;
velocity_16 = 0;
for i = 1:length(t) - 1
    if t_interpolate >= t(i) && t_interpolate <= t(i + 1)
        interval_index = i;
        break;
    end
end
f_t0 = v(interval_index);
f_t1 = v(interval_index + 1);
velocity_16 = f_t0 + (f_t1 - f_t0) / (t(interval_index + 1) - t(interval_index)) * (t_interpolate - t(interval_index));
fprintf('The velocity at t = %d seconds is approximately %.2f m/s\n', t_interpolate, velocity_16);