path = 'base/';

x = csvread(strcat(path, 'GSPC.csv'));

fileID = fopen(strcat(path, 'dates.csv'));
t = textscan(fileID,'%s');
fclose(fileID);
%x = cell2mat(x{1, 1});

figure(1)
plot(x);
set(gca,'xlim', [0 size(x, 1)]);
xlabel('t');
ylabel('x(t)');
title('S&P 500 Daily Closing Price');

indexes = [1:1000:size(x, 1) size(x, 1)];
values = t{1, 1};
set(gca,'XTick',indexes)
set(gca,'XTickLabel',values(indexes))
xtickangle(90)

saveas(gcf, strcat(path, 'plot.png'));

x = [x ; fliplr(x')'];

figure(2)
plot(x);
set(gca,'xlim', [0 size(x, 1)]);
xlabel('t');
ylabel('x(t)');
title('S&P 500 Daily Closing Price');

saveas(gcf, strcat(path, 'original_flipped.png'));

X = zeros(size(x, 1), 5);
y = zeros(size(x, 1), 1);

X(5:end, 1) = x(1:size(x, 1) - 4);
X(4:end, 2) = x(1:size(x, 1) - 3);
X(3:end, 3) = x(1:size(x, 1) - 2);
X(2:end, 4) = x(1:size(x, 1) - 1);
X(:, 5) = x;

y(1:size(x, 1) - 1) = x(2 : end);

csvwrite(strcat(path, 'X_real.csv'), X)
csvwrite(strcat(path, 'Y_real.csv'), y)