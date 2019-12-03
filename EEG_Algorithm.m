clear all
close all

load('F.mat');
load('N.mat');
load('O.mat');
load('S.mat');
load('Z.mat');

F = F(:,1);
N = N(:,1);
O = O(:,1);
S = S(:,1);
Z = Z(:,1);

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


data = [ffft,nfft,offt,sfft,zfft];
[U,SS,VV] = svd(data,'econ');
train_weights = U' * data;

figure
plot(frequencies_shifted,abs(U(:,1)))

%%
re = U * train_weights;
figure
%plot(frequencies_shifted,abs(re(:,4)))
plot(frequencies_shifted,abs(sfft))



%%
load('F.mat');
load('N.mat');
load('O.mat');
load('S.mat');
load('Z.mat');

F2 = F(:,1);
N2 = N(:,1);
O2 = O(:,1);
S2 = S(:,1);
Z2 = Z(:,1);

test_S = [fftshift(fft(S2))];
test_weights = U' * test_S;

[dist,index] = min(vecnorm(test_weights - train_weights))

a = test_weights' * U';
plot(frequencies_shifted,abs((a)))





%%
%%%%

% TEST CODE %


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


train = [sfft,ffft,nfft,offt,zfft];
[U,SS,VV] = svd(train,'econ');
train_weights = U' * train;

figure
% Use the Third EigenFFT for the 26 Hz signal
plot(frequencies_shifted,abs(U(:,3)))

%%
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

test = [sfft,ffft,nfft,offt,zfft];
test_weights = U' * test;

counter = 0;

for l=1:length(test_weights(1,:))
    % Using 51 eigen transforms we get 88.4% accuracy
    [dist,index] = min(vecnorm(test_weights(:,l) - train_weights(:,1:51)));
    if l <= 50 && (1 <= index) && (index <= 50)
        counter = counter + 1;
    elseif (51 <= l) && (51 <= index)
        counter = counter + 1;
    end
end
accuracy = counter / length(test_weights(:,1)) * 100

% NEXT STEPS
%  - only consider a range of frequencies
%  - combination of magnitude and frequency