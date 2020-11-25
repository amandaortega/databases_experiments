acerto = 0;
erro = 0;

for i = 1 : 14892
    if and(predictionseEVP(i + 1) > Ytest(i), Ytest(i + 1) > Ytest(i))
        acerto = acerto + 1;
    elseif and(predictionseEVP(i + 1) < Ytest(i), Ytest(i + 1) < Ytest(i))
        acerto = acerto + 1;
    else 
        erro = erro + 1;
    end
end

disp(['Acerto: ', int2str(acerto)]);
disp(['Erro: ', int2str(erro)]);