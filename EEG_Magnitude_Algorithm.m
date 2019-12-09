% TRAINING CODE %

clear all
close all

load('F.mat'); % Load the dataset F
load('N.mat'); % Load the dataset N
load('O.mat'); % Load the dataset O
load('S.mat'); % Load the dataset S
load('Z.mat'); % Load the dataset Z

% Training sets defined by the first 50 columns
F = F(:,1:50); 
N = N(:,1:50); 
O = O(:,1:50); 
S = S(:,1:50); 
Z = Z(:,1:50); 

Fs = 173.61; % Define the sampling frequency
N_shift = length(F); % Set the length of the shifted dataset
% Define the frequency_shifted vector
frequencies_shifted = (linspace(-pi*Fs, Fs*(pi - (2*pi)/N_shift), N_shift) + (Fs*pi)/(N_shift)*mod(N_shift, 2))';

% Find the fftshift for dataset F
ffft = fft(F);
ffft = fftshift(ffft);

% Find the fftshift for dataset N
nfft = fft(N);
nfft = fftshift(nfft);

% Find the fftshift for dataset O
offt = fft(O);
offt = fftshift(offt);

% Find the fftshift for dataset S
sfft = fft(S);
sfft = fftshift(sfft);

% Find the fftshift for dataset Z
zfft = fft(Z);
zfft = fftshift(zfft);

% Find the average of all the datasets
f = mean(abs(ffft));
n = mean(abs(nfft));
o = mean(abs(offt));
s = mean(mean(abs(sfft)));
z = mean(abs(zfft));

% Define vector that contains the non-seizure average EEG readings
nons = mean([f,n,o,z]);
% Define the threshold as the mean of seizure and non-seizure averages
% minus an offset to offset the threshold
threshold = mean([nons,s])-(0.2*s);

%%
% TEST CODE 

load('F.mat'); % Load the dataset F
load('N.mat'); % Load the dataset N
load('O.mat'); % Load the dataset O
load('S.mat'); % Load the dataset S
load('Z.mat'); % Load the dataset Z

% Test sets defined by the last 50 columns
F2 = F(:,51:end); 
N2 = N(:,51:end);
O2 = O(:,51:end);
S2 = S(:,51:end);
Z2 = Z(:,51:end);

% Find the fftshifted for the test sets
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

% Find the averages of the fft magnitude
f = mean(abs(ffft));
n = mean(abs(nfft));
o = mean(abs(offt));
s = mean(abs(sfft));
z = mean(abs(zfft));

% Define a new matrix that contains all the averages
mat = [s,f,n,o,z];
% Initialize the counter
counter = 0;
for l=1:length(mat)
    if (mat(l) >= threshold) && (l <= 50) % If the test is classified as a seizure reading
        counter = counter + 1; % Add one to the counter
    elseif (51 <= l) && (mat(l) <= threshold) % If the test is classified as a non-seizure reading
        counter = counter + 1; % Add one to the counter
    end
end
% Find the accuracy
accuracy = counter / length(mat) * 100