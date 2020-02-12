path = '/home/amanda/Dropbox/trabalho/doutorado/testes/aplicacoes/precipitação/data/';

for i = 1 : 86
    folder_name = strcat('s', int2str(i));
    cd(strcat(path, folder_name));
    data = readtable(strcat('s', int2str(i), '.csv'), 'HeaderLines', 1);
    Y_real = data{:, :}(:, 4);
    Y_real = (Y_real - min(Y_real)) / (max(Y_real) - min(Y_real));
    csvwrite('Y_real.csv', Y_real)
    
    plot(Y_real);
    saveas(gcf, 'plot.png');
    close all
end

% Y_real = [];
% 
% for i = 1 : 86
%     folder_name = strcat('s', int2str(i));
%     cd(strcat(path, folder_name));
%     Y_real = [ Y_real dlmread('Y_real.csv')];    
% end
% 
% cd(strcat(path, 'mean'))
% csvwrite('Y_real.csv', mean(Y_real, 2))