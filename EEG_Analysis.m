clear all
close all

load('F.mat');
load('N.mat');
load('O.mat');
load('S.mat');
load('Z.mat');

F = F(:,9);
N = N(:,9);
O = O(:,9);
S = S(:,9);
Z = Z(:,5);

Fs = 173.61;
N_shift = length(F);
frequencies_shifted = (linspace(-pi*Fs, Fs*(pi - (2*pi)/N_shift), N_shift) + (Fs*pi)/(N_shift)*mod(N_shift, 2))';

times = linspace(0,N_shift*1/Fs,101);

figure;
plot(1:length(F),F)
title('F')
ffft = fft(F);
ffft = fftshift(ffft);
figure;
plot(frequencies_shifted,abs((ffft)))
title('FFT of F Unprocessed')
[sorted, index] = sort(ffft);
for A=length(index)-8:length(index)
    ffft(index(A)) = 0;
end
figure;
plot(frequencies_shifted,abs((ffft)))
title('F Processed')


figure;
plot(1:length(N),N)
title('N')
nfft = fft(N);
nfft = fftshift(nfft);
figure;
plot(frequencies_shifted,abs((nfft)))
title('FFT of N Unprocessed')
[sorted, index] = sort(nfft);
for A=length(index)-70:length(index)
    nfft(index(A)) = 0;
end
figure;
plot(frequencies_shifted,abs((nfft)))
title('N Processed')


figure;
plot(1:length(O),O)
title('O')
offt = fft(O);
offt = fftshift(offt);
figure;
plot(frequencies_shifted,abs((offt)))
title('FFT of O Unprocessed')
[sorted, index] = sort(offt);
for A=length(index)-70:length(index)
    offt(index(A)) = 0;
end
figure;
plot(frequencies_shifted,abs((offt)))
title('O Processed')


figure;
plot(1:length(S),S)
title('S')
sfft = fft(S);
sfft = fftshift(sfft);
figure;
plot(frequencies_shifted,abs((sfft)))
%axis([0 150 0 3000000])
title('FFT of S Unprocessed')


figure;
plot(1:length(Z),Z)
title('Z')
zfft = fft(Z);
zfft = fftshift(zfft);
figure;
plot(frequencies_shifted,abs((zfft)))
title('FFT of Z Unprocessed')
[sorted, index] = sort(zfft);
%for A=length(index)-120:length(index)
%    zfft(index(A)) = 0;
%end
figure;
plot(frequencies_shifted,abs((zfft)))
%axis([0 150 0 3000000])
title('Z Processed')

close all
figure
hold on
subplot(2,1,1)
plot(frequencies_shifted,abs((zfft)),'b')
title('Normal EEG')
xlabel('Frequency [Hz]')
ylabel('Magnitude')
axis([0 60 0 30000])
subplot(2,1,2)
plot(frequencies_shifted,abs((sfft)),'r')
title('Seizure EEG')
xlabel('Frequency [Hz]')
ylabel('Magnitude')
axis([0 60 0 250000])
hold off

%%
data = [ffft,nfft,offt,sfft,zfft];
[U,SS,VV] = svd(data,'econ');
train_weights = U' * data;

test_S = [fft(S)];
test_weights = U' * test_S;

a = test_weights' * U';
plot(frequencies_shifted,abs(fftshift(a)))

[dist,index] = min(vecnorm(test_weights - train_weights))





