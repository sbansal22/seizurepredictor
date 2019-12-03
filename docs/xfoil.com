load sample16-2.dat

pane
oper
iter 1000
visc 2e7
pacc
./sample16-2.dat.analysis

aseq 0 10 4
pacc

quit
