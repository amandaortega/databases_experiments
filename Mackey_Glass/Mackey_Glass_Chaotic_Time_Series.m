a        = 0.2;     % value for a in eq (1)
b        = 0.1;     % value for b in eq (1)
tau      = 17;		% delay constant in eq (1)
x0       = 1.2;		% initial condition: x(t=0)=x0
deltat   = 1;	    % time step size (which coincides with the integration step)
sample_n = 6000;	% total no. of samples, excluding the given initial condition

time = 0;
index = 1;
history_length = floor(tau/deltat);
x_history = zeros(history_length, 1); % here we assume x(t)=0 for -tau <= t < 0
x_t = x0;

x = zeros(sample_n+1, 1); % vector of all generated x samples
T = zeros(sample_n+1, 1); % vector of time samples

for i = 1:sample_n+1
    x(i) = x_t;

    if tau == 0
        x_t_minus_tau = 0.0;
    else
        x_t_minus_tau = x_history(index);
    end

    x_t_plus_deltat = mackeyglass_rk4(x_t, x_t_minus_tau, deltat, a, b);

    if (tau ~= 0)
        x_history(index) = x_t_plus_deltat;
        index = mod(index, history_length)+1;
    end
    time = time + deltat;
    T(i) = time;
    x_t = x_t_plus_deltat;
end

figure
plot(T, x);
set(gca,'xlim',[0, T(end)]);
xlabel('t');
ylabel('x(t)');
title(sprintf('A Mackey-Glass time serie (tau=%d)', tau));

path = 'base/';
saveas(gcf, strcat(path, 'plot.png'));

X = zeros(6001, 4);
y = zeros(6001, 1);

X(19:end, 1) = x(1:5983);
X(13:end, 2) = x(1:5989);
X(7:end, 3) = x(1:5995);
X(:, 4) = x;
y(1:5916) = x(86:end);

X = X(2:end, :);
y = y(2:end, :);

csvwrite(strcat(path, 'X_real.csv'), X)
csvwrite(strcat(path, 'Y_real.csv'), y)

function x_dot = mackeyglass_eq(x_t, x_t_minus_tau, a, b)
    x_dot = -b*x_t + a*x_t_minus_tau/(1 + x_t_minus_tau^10.0);
end

function x_t_plus_deltat = mackeyglass_rk4(x_t, x_t_minus_tau, deltat, a, b)
    k1 = deltat*mackeyglass_eq(x_t,          x_t_minus_tau, a, b);
    k2 = deltat*mackeyglass_eq(x_t+0.5*k1,   x_t_minus_tau, a, b);
    k3 = deltat*mackeyglass_eq(x_t+0.5*k2,   x_t_minus_tau, a, b);
    k4 = deltat*mackeyglass_eq(x_t+k3,       x_t_minus_tau, a, b);
    x_t_plus_deltat = (x_t + k1/6 + k2/3 + k3/3 + k4/6);
end