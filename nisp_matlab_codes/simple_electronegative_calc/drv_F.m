% Code Description: Solves the equation of square of normalized electric field 
% to find the electric potential and field in the domain for a simple 
% electronegative plasma containing one species of positive ion, electrons 
% and negative ions. This solves a single first order ODE.  
% Function Invoked: sub_F.m 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
clc; clearvars;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
global psis gamma psip alpha0 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alphaEnd = 6.0;
alphaIncrement = 0.001;
filename = ['psis_alpha_',num2str(alphaEnd,'%.3f'),'_increment_',num2str(alphaIncrement,'%.3f'),'.mat'];
load(filename)
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Fernandez Palop et al. 2002 used alpha0 = 1.5, 1.569, 1.75, 1.849, 2.0
alpha0 = input('Enter the value of alpha0: '); 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% mi are the multiple entry indices of xdata
mi = find_xdata(xdata,alpha0);
% find the 'ydata' corresponding to all multiple 'xdata' 
multiple_ydata = ydata(mi);
% find the lowest 'ydata' out of all these ydata
lowest_ydata = min(multiple_ydata);
psi_1 = max(multiple_ydata);
psi_2 = min(multiple_ydata);
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% psis = lowest_ydata;
if (alpha0>=1.569 && alpha0<1.975)  
    psis = psi_1;
    fprintf('The value of psi is:%f\n',psi_1);
else
    psis = psi_2;
    fprintf('The value of psi is:%f\n',psi_2);
end
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
[x,y] = ode45('sub_F',[0 -50],psip);
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
C1 = exp(-psis) + alpha0*exp(-gamma*psis);
n1ps_ne0 = C1;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
F1 = 4*n1ps_ne0.*(sqrt(psis*y(:,1))-psis);
F2 = 2*(exp(-y(:,1))-exp(-psis));
F3 = (2*alpha0/gamma).*(exp(-gamma*y(:,1))-exp(-gamma*psis));
F = F1 + F2 + F3;
E = sqrt(F);
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
figure(1)
subplot(121) 
plot(x,y(:,1), 'linewidth',2), grid on, hold on
xlabel('X'), ylabel('\Psi')
xlim([-50 0]), ylim([0 5])
subplot(122) 
plot(x,real(E),'linewidth',2), grid on, hold on
% subplot(133) 
% plot(x,F,'linewidth',2), grid on, hold on
% ------------------------------------------------------------------------
% Calculate the densities 
N1 = n1ps_ne0*sqrt(psis./y(:,1)); % Normalized positive ion density
Ne = exp(-y(:,1));                % Normalized Electron ion density
Nn = alpha0*exp(-gamma*y(:,1));   % Normalized Negative ion density
% ------------------------------------------------------------------------
figure(2)
plot(x,N1,'r','linewidth',2), grid on, hold on
plot(x,Ne,'b','linewidth',2), grid on, hold on
plot(x,Nn,'k','linewidth',2), grid on, hold on
xlabel('X'), ylabel('Density')
legend('N1','Ne','Nn')
% ------------------------------------------------------------------------
% Calculate the Space Charge and Plot
sigma = N1 - Ne - Nn;
figure(4)
plot(x,sigma,'linewidth',2), grid on, hold on
xlabel('X'), ylabel('\sigma')
% ------------------------------------------------------------------------
filename = ['pot_F_alpha_',num2str(alpha0,'%.3f'),'.mat'];
save(filename)

