close all
clear all
clc

variable = "F";

NN = 100;
for i = 1:NN
    number = string(i);
    if strlength(number) == 1
        number = "00" + number;
    end
    if strlength(number) == 2
        number = "0" + number;
    end
    name = variable + number + ".txt";
    vectorname = "C:\Users\tjagielski\Documents\Projects\School\Sophomore - Semester 1\QEA 2\Module 2\EEG Data\" + variable + "\" + name;
    vector = importfile(vectorname,[1, Inf]);
    output(:,i) = vector;
end