path = '/home/amanda/Dropbox/trabalho/doutorado/testes/aplicacoes/precipitação/data/';

for i = 1 : 86
    folder_name = strcat('s', int2str(i));
    mkdir(path, folder_name);
    movefile(strcat(path, 's', int2str(i), '.csv'), strcat(path, folder_name));
end