close all
clear all
clc

% Define variable as the dataset letter being used
variable = "F"; 

% Set the number of files as NN
NN = 100;
for i = 1:NN
    number = string(i); % Convert the index number to a string
    if strlength(number) == 1 % Compare the length of the index
        number = "00" + number; % If the index is length one, add two zeros in front
                                % This is how the dataset is defined
    end
    if strlength(number) == 2 % Compare the length of the index
        number = "0" + number; % If the index is length two, add one zero in front
                               % This is how the dataset is defined
    end
    name = variable + number + ".txt"; % Convert the filename to a string
    % Set the filepath
    vectorname = "C:\Users\tjagielski\Documents\Projects\School\Sophomore - Semester 1\QEA 2\Module 2\EEG Data\" + variable + "\" + name;
    vector = importfile(vectorname,[1, Inf]); % Import the current text file defined by the loop iteration
    output(:,i) = vector; % Add the vector to an output matrix of the entire dataset
end