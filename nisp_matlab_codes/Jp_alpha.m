% Code Description: Plot the total positive ion current density (Jp) with 
% psi for diferent values of alpha0 and fixed delta and n2ps_ne0.   
clc; clearvars;
% -------------------------------------------------------------------------
AMU = 1.67E-27;
mn=1*AMU;
m1p = 1*AMU;
% -------------------------------------------------------------------------
alpha0 = input('Enter the value of alpha0: '); % Check for alpha0 = 0.0, 1.0, 2.0, 5.0
gamma = 15;
psip = 5;
% -------------------------------------------------------------------------
delta = 0.4;
n2ps_ne0 = 0.2;
psis = linspace(0.0, 3.0, 1000);
% +++++++++++++++++++++++++ Expressions ++++++++++++++++++++++++++++++++++
C1 = exp(-psis) + alpha0*exp(-gamma*psis);
D = (1-delta*sqrt(mn/m1p).*sqrt(psis./(psip-psis)));
n1ps_ne0 = (C1-n2ps_ne0)./D;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
index = find(psis>=0.5); % 0.5 is chosen because for alpha=0 this is the appropriate 'psis'.
if ((C1(index(1))-n2ps_ne0)<0) % || ~isreal(n1ps_ne0) 
    disp('Error: imaginary or negative density!')
    return
end
% ++++++++++++++++++++++++ Current Density +++++++++++++++++++++++++++++++
J1 = n1ps_ne0.*sqrt(psis);
J2 = n2ps_ne0.*sqrt(psis);
Jp = (J1 + J2);
% +++++++++++++++++++++ Save MAT File +++++++++++++++++++++++++++++++++++
filename = ['./Jp_alpha_var/Jp_alpha_',num2str(alpha0,'%.3f'),'_delta_',num2str(delta,'%.1f'),'_n2ps_ne0_',num2str(n2ps_ne0,'%.1f'),'.mat'];
save(filename,'psis','J1','J2','Jp')  
