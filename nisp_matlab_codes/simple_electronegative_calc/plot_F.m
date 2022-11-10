
clc; clearvars;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alphaEnd = 6.0;
alphaIncrement = 0.001;
filename = ['psis_alpha_',num2str(alphaEnd,'%.3f'),'_increment_',num2str(alphaIncrement,'%.3f'),'.mat'];
load(filename)
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alpha0 = input('Enter the value of alpha0: ');
% ------------------------------------------------------------------------
% mi are the multiple entry indices of xdata
mi = find_xdata(xdata,alpha0);

% find the 'ydata' corresponding to all multiple 'xdata' 
multiple_ydata = ydata(mi);

% find the lowest 'ydata' out of all these ydata
lowest_ydata = min(multiple_ydata);
%fprintf('The lowest ydata is:%f\n',lowest_ydata);
% ------------------------------------------------------------------------
psis = lowest_ydata;
C1 = exp(-psis) + alpha0*exp(-gamma*psis);
n1ps_ne0 = C1;
% ------------------------------------------------------------------------
psi = 0.0:0.01:1.5;
% ------------------------------------------------------------------------
F1 = 4.*n1ps_ne0.*(sqrt(psis.*psi)-psis);
F2 = 2*(exp(-psi)-exp(-psis));
F3 = (2*alpha0/gamma).*(exp(-gamma*psi)-exp(-gamma*psis));
F = F1 + F2 + F3;
%------------------------------------------------------------------------
j = find(F>=-1.0E-6);
figure(1)
% plot(psi,F,'linewidth',1.5), grid on, hold on
plot(psi(min(j):end),F(min(j):end),'linewidth',2.0); grid on, hold on
plot(psi(min(j)),F(min(j)),'.','markersize',15); grid on, hold on
legend('\alpha_{0}=1.5','\alpha_{0}=1.5','\alpha_{0}=1.569','\alpha_{0}=1.569', ...
    '\alpha_{0}=1.75','\alpha_{0}=1.75','\alpha_{0}=1.849','\alpha_{0}=1.849','\alpha_{0}=2.0','\alpha_{0}=2.0','Location','best')
xlim([0.0 1.5])
xlabel('\Psi'), ylabel('F(\Psi,\Psi_{s})')
