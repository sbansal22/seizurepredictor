% TRAINING CODE %

clear all
close all

load('F.mat');
load('N.mat');
load('O.mat');
load('S.mat');
load('Z.mat');

F = F(:,1:50);
N = N(:,1:50);
O = O(:,1:50);
S = S(:,1:50);
Z = Z(:,1:50);

Fs = 173.61;
N_shift = length(F);
frequencies_shifted = (linspace(-pi*Fs, Fs*(pi - (2*pi)/N_shift), N_shift) + (Fs*pi)/(N_shift)*mod(N_shift, 2))';

ffft = fft(F);
ffft = fftshift(ffft);

nfft = fft(N);
nfft = fftshift(nfft);

offt = fft(O);
offt = fftshift(offt);

sfft = fft(S);
sfft = fftshift(sfft);

zfft = fft(Z);
zfft = fftshift(zfft);

f = mean(abs(ffft));
n = mean(abs(nfft));
o = mean(abs(offt));
s = mean(mean(abs(sfft)));
z = mean(abs(zfft));

nons = mean([f,n,o,z]);
threshold = mean([nons,s])-(0.2*s);

train = [sfft,ffft,nfft,offt,zfft];
[U,SS,VV] = svd(train,'econ');
train_weights = U' * train;

figure
% Use the Third EigenFFT for the 26 Hz signal
plot(frequencies_shifted,abs(U(:,3)))
title('Eigenfrequency')
xlabel('Frequency [Hz]')
ylabel('Amplitude')
axis([-120 120 0 0.12])

%%
% TEST CODE %
load('F.mat');
load('N.mat');
load('O.mat');
load('S.mat');
load('Z.mat');

F2 = F(:,51:end);
N2 = N(:,51:end);
O2 = O(:,51:end);
S2 = S(:,51:end);
Z2 = Z(:,51:end);

ffft = fft(F2);
ffft = fftshift(ffft);

nfft = fft(N2);
nfft = fftshift(nfft);

offt = fft(O2);
offt = fftshift(offt);

sfft = fft(S2);
sfft = fftshift(sfft);

zfft = fft(Z2);
zfft = fftshift(zfft);

f = mean(abs(ffft));
n = mean(abs(nfft));
o = mean(abs(offt));
s = mean(abs(sfft));
z = mean(abs(zfft));

mat = [s,f,n,o,z];
counter = 0;
for l=1:length(mat)
    if (mat(l) >= threshold) && (l <= 50)
        counter = counter + 1;
    elseif (51 <= l) && (mat(l) <= threshold)
        counter = counter + 1;
    end
end
accuracy = counter / length(mat) * 100