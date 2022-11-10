
clc; clearvars;
gamma = 15; 
alpha0 = 5.0; % Check for alpha0 = 0.0, 1.0, 2.0, 5.0
psip = 5; 
delta = 0.2;

psis = linspace(0.01, 3.0, 200);
% +++++++++++++++++++++++++ Expressions ++++++++++++++++++++++++++++++++++
C1 = exp(-psis) + alpha0*exp(-gamma*psis);
C2 = 0.5*(1./(psis-sqrt(psis*psip))).*( (exp(-psip)-exp(-psis)) + (alpha0/gamma)*(exp(-gamma*psip)-exp(-gamma*psis)));
K = delta*(sqrt(psis./(psip-psis)) + sqrt(psis.*(psip-psis))./(psis-sqrt(psip*psis)) );
n1ps_ne0 = (C2-C1)/K;
n2ps_ne0 = C1 - (1-delta*sqrt(psis/(psip-psis)))*n1ps_ne0;

% ++++++++++++++++++++++++ Current Density +++++++++++++++++++++++++++++++
J1 = n1ps_ne0.*sqrt(psis);
J2 = n2ps_ne0.*sqrt(psis);
Jp = (J1 + J2);

% +++++++++++++++++++++ Save MAT File +++++++++++++++++++++++++++++++++++
filename = ['alpha_',num2str(alpha0,'%.1f'),'.mat'];
save(filename,'psis','J1','J2','Jp')  
