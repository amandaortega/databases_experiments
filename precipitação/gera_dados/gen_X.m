path = '/home/amanda/Dropbox/trabalho/doutorado/testes/aplicacoes/precipitação/data/';
D = 2;

for i = 1 : 86
    folder_name = strcat('s', int2str(i));
    cd(strcat(path, folder_name));
    
    Y_train = dlmread('Y_real.csv');
    Y_test = flip(Y_train);
    
    csvwrite('Y_train.csv', Y_train)
    csvwrite('Y_test.csv', Y_test)
    
    N = size(Y_train, 1);
    
    X_train = NaN(N, D);
    X_test = NaN(N, D);
    
    for dim = 1 : D
        X_train(dim + 1 : end, D - dim + 1) = Y_train(1 : N - dim);
        X_test(dim + 1 : end, D - dim + 1) = Y_test(1 : N - dim);
    end
    
    X_train(1 : D, :) = [];
    X_test(1 : D, :) = [];
    Y_train(1 : D) = [];
    Y_test(1 : D) = [];    
    
    csvwrite('X_train.csv', X_train)
    csvwrite('Y_train.csv', Y_train)
    csvwrite('X_test.csv', X_test)
    csvwrite('Y_test.csv', Y_test)
end