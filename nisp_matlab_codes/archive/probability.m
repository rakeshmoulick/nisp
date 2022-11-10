clc; clearvars;
k = 1.38E-23;
Te = 200*11600;
AMU = 1.67E-27;
m1p = 1*AMU;
E = 11.91E-20;
a = 0.3;
phi = 1.5*1.6E-19;
v = sqrt(2*k*Te*5/m1p);
P = (2/pi)*exp(-pi*(phi-E)/(2*a*v));
disp(P)