% Code Description: Solves the Poisson's equation to find the electric
% potential in the domain for a simple electronegative plasma containing 
% one species of positive ion, electrons and negative ions.
% Function Invoked: sub_pot.m 
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
clc; clearvars;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alphaEnd = 6.0;
alphaIncrement = 0.001;
filename = ['psis_alpha_',num2str(alphaEnd,'%.3f'),'_increment_',num2str(alphaIncrement,'%.3f'),'.mat'];
load(filename)
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
global alpha0 gamma psip psis
% Fernandez Palop et al. 2002 used alpha0 = 1.5, 1.569, 1.75, 1.849, 2.0
alpha0 = input('Enter the value of alpha0: '); 
% ------------------------------------------------------------------------
% mi are the multiple entry indices of xdata
mi = find_xdata(xdata,alpha0);

% find the 'ydata' corresponding to all multiple 'xdata' 
multiple_ydata = ydata(mi);

% find the lowest 'ydata' out of all these ydata
lowest_ydata = min(multiple_ydata);
% fprintf('The lowest ydata is:%f\n',lowest_ydata);
% ------------------------------------------------------------------------
psis = lowest_ydata;
C1 = exp(-psis) + alpha0*exp(-gamma*psis);
n1ps_ne0 = C1;
% ------------------------------------------------------------------------
% xspan = 0:-0.001:-60;
% ------------------------------------------------------------------------
% Calculate the electric field at the wall (Ep).
A = 4*n1ps_ne0*(sqrt(psis*psip)-psis);
B = 2*(exp(-psip)-exp(-psis));
C = (2*alpha0/gamma)*(exp(-gamma*psip)-exp(-gamma*psis));
Fp = A + B + C;
Ep = sqrt(Fp);
% ------------------------------------------------------------------------
% Solve via ODE45
[x,y] = ode45('sub_pot',[0 -50],[psip Ep]);
% ------------------------------------------------------------------------
figure(1)
subplot(121), plot(x,abs(y(:,1)),'linewidth',2), grid on, hold on
xlabel('X'), ylabel('\Psi')
xlim([-50 0]), ylim([0.0 5.0])
legend('\alpha_{0}=1.5','\alpha_{0}=1.569','\alpha_{0}=1.75','\alpha_{0}=1.849','\alpha_{0}=2.0')
subplot(122), plot(x,y(:,2)), grid on, hold on
xlabel('X'), ylabel('E')
% ------------------------------------------------------------------------
% Calulate the Space Charge Density
N1 = n1ps_ne0.*sqrt(psis./y(:,1)); % Normalized Positive Ion Density
Ne = exp(-y(:,1));                 % Normalized Electron Density
Nn = alpha0*exp(-gamma*y(:,1));    % Normalized Negative Ion Density
sigma = N1 - Ne - Nn;              % Normalized Space Charge Density
% ------------------------------------------------------------------------
figure(2)
plot(x,N1,'r','linewidth',2), grid on, hold on
plot(x,Ne,'b','linewidth',2), grid on, hold on
plot(x,Nn,'k','linewidth',2), grid on, hold on
xlabel('X'), ylabel('Density')
legend('N1','Ne','Nn')
% ------------------------------------------------------------------------
figure(3)
plot(x,sigma,'linewidth',2), grid on, hold on
xlabel('X'), ylabel('\sigma')
% ------------------------------------------------------------------------
filename = ['pot_poisson_alpha_',num2str(alpha0,'%.3f'),'.mat'];
save(filename)