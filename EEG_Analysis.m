clear all
close all

load('F.mat')
load('N.mat')
load('O.mat')
load('S.mat')
load('Z.mat')

Fs = 173.61;
N_shift = length(F);
frequencies_shifted = (linspace(-pi*Fs, Fs*(pi - (2*pi)/N_shift), N_shift) + (Fs*pi)/(N_shift)*mod(N_shift, 2))';

times = linspace(0,N_shift*1/Fs,101);

figure;
plot(1:length(F),F)
title('F')
ffft = fft(F);
figure;
plot(frequencies_shifted,abs(fftshift(ffft)))
title('F')

figure;
plot(1:length(N),N)
title('N')
nfft = fft(N);
figure;
plot(frequencies_shifted,abs(fftshift(nfft)))
title('N')

figure;
plot(1:length(O),O)
title('O')
offt = fft(O);
figure;
plot(frequencies_shifted,abs(fftshift(offt)))
title('O')

figure;
plot(1:length(S),S)
title('S')
sfft = fft(S);
figure;
plot(frequencies_shifted,abs(fftshift(sfft)))
title('S')

figure;
plot(1:length(Z),Z)
title('Z')
zfft = fft(Z);
figure;
plot(frequencies_shifted,abs(fftshift(zfft)))
title('Z')

data = [ffft,nfft,offt,sfft,zfft];
[U,SS,VV] = svd(data,'econ');
train_weights = U' * data;

test_S = [fft(S)];
test_weights = U' * test_S;

a = test_weights' * U';
plot(frequencies_shifted,abs(fftshift(a)))

[dist,index] = min(vecnorm(test_weights - train_weights))