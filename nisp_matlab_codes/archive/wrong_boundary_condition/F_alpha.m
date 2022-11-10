
clc; clearvars;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
load psis.mat
gamma = 15.0; % keep fixed
alpha0 = 4.0; % vary from 1.0 to 5.0 
psip = 5; % keep fixed
delta = 0.2; % F does not vary with delta
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% mi are the multiple entry indices of xdata
mi = find_xdata(xdata,alpha0);
% find the 'ydata' corresponding to all multiple 'xdata' 
multiple_ydata = ydata(mi);
% find the lowest 'ydata' out of all these ydata
lowest_ydata = min(multiple_ydata);
disp('lowest ydata is: ');
disp(lowest_ydata);
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
psis = lowest_ydata;
psi = linspace(0.01, 3, 200);
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
C1 = exp(-psis) + alpha0*exp(-gamma*psis);
C2 = 0.5*(1./(psis-sqrt(psis*psip))).*( (exp(-psip)-exp(-psis)) + (alpha0/gamma)*(exp(-gamma*psip)-exp(-gamma*psis)));
K = delta*(sqrt(psis./(psip-psis)) + sqrt(psis.*(psip-psis))./(psis-sqrt(psip*psis)) );
n1ps_ne0 = (C2-C1)/K;
n2ps_ne0 = C1 - (1-delta*sqrt(psis/(psip-psis)))*n1ps_ne0;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
F1 = 4*n1ps_ne0.*(sqrt(psis*psi)-psis);
F2 = 4*n2ps_ne0*(sqrt(psis.*psi)-psis);
F3 = 2*(exp(-psi)-exp(-psis));
F4 = (2*alpha0/gamma).*(exp(-gamma*psi)-exp(-gamma*psis));
F5 = 4*delta*n1ps_ne0*sqrt(mn/m1p).*sqrt(psis).*(sqrt(psip-psi)-sqrt(psip-psis));
F = F1 + F2 + F3 + F4 + F5; 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
plot(psi,F,'LineWidth',2), hold on
xlabel('\Psi'), ylabel('F(\Psi,\Psi_{s})')
grid on
%legend('\alpha_{0} = 2.0','\alpha_{0} = 4.0','\alpha_{0} = 6.0')
legend('\gamma = 3.0','\gamma = 5.0','\gamma = 10.0', '\gamma = 15.0')
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++