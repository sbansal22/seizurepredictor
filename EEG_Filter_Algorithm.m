clear all
close all

%%
% TRAINING DATA

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

% 88 %
lower_filter = 1600;
higher_filter = 2499;

%lower_filter = 1900;
%higher_filter = 2100;

ffft = fft(F);
ffft = fftshift(ffft);
ffft_filtered = zeros(size(ffft));
for k=1:size(ffft,2)
    ffft_filtered(:,k) = Rangefinder(ffft(:,k),lower_filter,higher_filter);
end
ffft = ffft_filtered;

nfft = fft(N);
nfft = fftshift(nfft);
nfft_filtered = zeros(size(nfft));
for k=1:size(nfft,2)
    nfft_filtered(:,k) = Rangefinder(nfft(:,k),lower_filter,higher_filter);
end
nfft = nfft_filtered;

offt = fft(O);
offt = fftshift(offt);
offt_filtered = zeros(size(offt));
for k=1:size(offt,2)
    offt_filtered(:,k) = Rangefinder(offt(:,k),lower_filter,higher_filter);
end
offt = offt_filtered;

sfft = fft(S);
sfft = fftshift(sfft);
sfft_filtered = zeros(size(sfft));
for k=1:size(sfft,2)
    sfft_filtered(:,k) = Rangefinder(sfft(:,k),lower_filter,higher_filter);
end
sfft = sfft_filtered;

zfft = fft(Z);
zfft = fftshift(zfft);
zfft_filtered = zeros(size(zfft));
for k=1:size(zfft,2)
    zfft_filtered(:,k) = Rangefinder(zfft(:,k),lower_filter,higher_filter);
end
zfft = zfft_filtered;

data = [sfft,nfft,offt,ffft,zfft];
[U,SS,VV] = svd(data,'econ');
train_weights = U' * data;

for l=1:size(U,2)
    U(:,l) = movmean(U(:,l),7);
end

%%
% TEST DATA
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
ffft_filtered = zeros(size(ffft));
for k=1:size(ffft,2)
    ffft_filtered(:,k) = Rangefinder(ffft(:,k),lower_filter,higher_filter);
end
ffft = ffft_filtered;

nfft = fft(N2);
nfft = fftshift(nfft);
nfft_filtered = zeros(size(nfft));
for k=1:size(nfft,2)
    nfft_filtered(:,k) = Rangefinder(nfft(:,k),lower_filter,higher_filter);
end
nfft = nfft_filtered;

offt = fft(O2);
offt = fftshift(offt);
offt_filtered = zeros(size(offt));
for k=1:size(offt,2)
    offt_filtered(:,k) = Rangefinder(offt(:,k),lower_filter,higher_filter);
end
offt = offt_filtered;

sfft = fft(S2);
sfft = fftshift(sfft);
sfft_filtered = zeros(size(sfft));
for k=1:size(sfft,2)
    sfft_filtered(:,k) = Rangefinder(sfft(:,k),lower_filter,higher_filter);
end
sfft = sfft_filtered;

zfft = fft(Z2);
zfft = fftshift(zfft);
zfft_filtered = zeros(size(zfft));
for k=1:size(zfft,2)
    zfft_filtered(:,k) = Rangefinder(zfft(:,k),lower_filter,higher_filter);
end
zfft = zfft_filtered;

test = [sfft,ffft,nfft,offt,zfft];
test_weights = U' * test;

counter = 0;

for l=1:length(test_weights(1,:))
    [dist,index] = min(vecnorm(test_weights(:,l) - train_weights));
    if l <= 50 && (1 <= index) && (index <= 50)
        counter = counter + 1;
    elseif (51 <= l) && (51 <= index)
        counter = counter + 1;
    end
end
accuracy = counter / length(test_weights(:,1)) * 100