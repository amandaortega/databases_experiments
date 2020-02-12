total_samples = 3000;

X = zeros(total_samples, 2);
y = zeros(total_samples, 1);

y_now = 0;

for t = 1 : total_samples
    if or(t <= 1000, t >= 2001)
        n = 0;
    elseif and(t >= 1001, t <= 1500)
        n = 0.5;
    else
        n = 1;
    end
    
    u = sin(2 * pi * t / 100);
    
    y_next = y_now / (1 + y_now ^ 2) + u ^ 3 + n;
    
    X(t, :) = [u y_now];
    y(t) = y_next;
    
    y_now = y_next;
end

path = strcat(pwd, '/base/');

plot(y);
set(gca,'xlim',[0, total_samples]);
xlabel('t');
ylabel('x(t)');
title('Nonlinear Dynamic Plant Identification');
savefig(strcat(path, 'plot.fig'));
saveas(gcf, strcat(path, 'plot.png'));

csvwrite(strcat(path, 'X_real.csv'), X)
csvwrite(strcat(path, 'Y_real.csv'), y)