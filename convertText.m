files = dir('*.txt') ;
N = length(files) ;
for i = 1:N
    thisfile = files(i).name ;
    S = importdata(thisfile) ;
    matfile = strcat(thisfile,'.mat')
    save(matfile,'S') ;
    clearvars S
end