% Code Description: Solves the equation of square of normalized electric field 
% to find the electric potential and field in the domain for a simple 
% electronegative plasma containing one species of positive ion, electrons 
% and negative ions. This solves a single first order ODE.  
% Function Invoked: sub_F.m 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
clc; clearvars;
global psis gamma alpha0 delta n2ps_ne0 mn m1p psip
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alphaEnd = 9.0;
alphaIncrement = 0.001;
delta = 0.2;
n2ps_ne0 = 0.2;
filename = ['./psis_data/psis_alpha_',num2str(alphaEnd,'%.3f'),'_increment_',...
    num2str(alphaIncrement,'%.3f'),'_delta_',num2str(delta,'%.1f'),'_n2ps_',num2str(n2ps_ne0,'%.1f'),'.mat'];
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
% lowest_ydata = min(multiple_ydata);
psi_1 = max(multiple_ydata);
psi_2 = min(multiple_ydata);
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% psis = lowest_ydata;
if (alpha0>=1.643 && alpha0<2.097) % if (alpha0>=1.725 && alpha0<2.243) for delta=0.4  
    psis = psi_1;
else
    psis = psi_2;
end
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
xspan = 0:-0.001:-20;
[x,y] = ode45('sub_F',xspan,psip);
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
C1 = exp(-psis) + alpha0*exp(-gamma*psis);
D = (1-delta*sqrt(mn/m1p).*sqrt(psis./(psip-psis)));
n1ps_ne0 = (C1-n2ps_ne0)./D;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
F1 = 4*n1ps_ne0.*(sqrt(psis*y(:,1))-psis);
F2 = 4*n2ps_ne0*(sqrt(psis.*y(:,1))-psis);
F3 = 2*(exp(-y(:,1))-exp(-psis));
F4 = (2*alpha0/gamma).*(exp(-gamma*y(:,1))-exp(-gamma*psis));
F5 = 4*delta*n1ps_ne0*sqrt(mn/m1p).*sqrt(psis).*(sqrt(psip-y(:,1))-sqrt(psip-psis));
F = F1 + F2 + F3 + F4 + F5; 
E = sqrt(F);
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
figure(1)
%subplot(121) 
plot(x,y(:,1), 'linewidth',2), grid on, hold on
xlabel('X'), ylabel('\Psi')
ylim([0 5])
legend('\alpha_{0}=2.0','\alpha_{0}=2.097','\alpha_{0}=3.0','\alpha_{0}=4.0','location','best')
%subplot(122) 
%plot(x,real(E),'linewidth',2), grid on, hold on
% subplot(133) 
% plot(x,F,'linewidth',2), grid on, hold on
% ------------------------------------------------------------------------
% Calculate the densities 
N1 = n1ps_ne0*sqrt(psis./y(:,1)); % Normalized First positive ion density
N2 = n2ps_ne0*sqrt(psis./y(:,1)); % Normalized Second positive ion density
Ne = exp(-y(:,1));                % Normalized Electron ion density
Nn = alpha0*exp(-gamma*y(:,1));   % Normalized Negative ion density
Ns = delta.*(n1ps_ne0).*sqrt(mn/m1p).*sqrt(psis./(psip-y(:,1)));
% ------------------------------------------------------------------------
% figure(2)
% plot(x,N1,'r','linewidth',2), grid on, hold on
% plot(x,N2,'g','linewidth',2), grid on, hold on
% plot(x,Ne,'b','linewidth',2), grid on, hold on
% plot(x,Nn,'k','linewidth',2), grid on, hold on
% plot(x,Ns,'m','linewidth',2), grid on, hold on
% ------------------------------------------------
figure(2)
plot(x,N1+N2,'r','linewidth',2), grid on, hold on
plot(x,Ne+Nn+Ns,'b','linewidth',2), grid on, hold on
xlabel('X'), ylabel('Density')
legend('N+','N-')
% ------------------------------------------------------------------------
% Calculate the Space Charge and Plot
sigma = N1 + N2 - Ne - Nn - Ns;
figure(3)
plot(x,sigma,'linewidth',2), grid on, hold on
xlabel('X'), ylabel('\sigma')
legend('\alpha_{0}=2.0','\alpha_{0}=2.097','\alpha_{0}=3.0','\alpha_{0}=4.0','location','best')
ylim([-0.2 0.5])
% ------------------------------------------------------------------------
filename = ['pot_F_alpha_',num2str(alpha0,'%.3f'),'.mat'];
save(filename)

