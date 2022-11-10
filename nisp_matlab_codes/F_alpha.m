% Code Description : To plot F with psi for various alpha0 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
clc; clearvars;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alphaEnd = 6.0;
alphaIncrement = 0.001;
delta = 0.2;
n2ps_ne0 = 0.2;
filename = ['./psis_data/psis_alpha_',num2str(alphaEnd,'%.3f'),'_increment_',...
    num2str(alphaIncrement,'%.3f'),'_delta_',num2str(delta,'%.1f'),'_n2ps_',num2str(n2ps_ne0,'%.1f'),'.mat'];
load(filename)
% ------------------------------------------------------------------------
alpha0 = input('Enter the value of alpha0: ');
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% mi are the multiple entry indices of xdata
mi = find_xdata(xdata,alpha0);
% find the 'ydata' corresponding to all multiple 'xdata' 
multiple_ydata = ydata(mi);
% find the lowest 'ydata' out of all these ydata
lowest_ydata = min(multiple_ydata);
% fprintf('The lowest ydata is %f\n',lowest_ydata);
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
psis = lowest_ydata;
psi = linspace(0.01, 3.0, 200);
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
C1 = exp(-psis) + alpha0*exp(-gamma*psis);
D = (1-delta*sqrt(mn/m1p).*sqrt(psis./(psip-psis)));
n1ps_ne0 = (C1-n2ps_ne0)./D;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
F1 = 4*n1ps_ne0.*(sqrt(psis*psi)-psis);
F2 = 4*n2ps_ne0*(sqrt(psis.*psi)-psis);
F3 = 2*(exp(-psi)-exp(-psis));
F4 = (2*alpha0/gamma).*(exp(-gamma*psi)-exp(-gamma*psis));
F5 = 4*delta*n1ps_ne0*sqrt(mn/m1p).*sqrt(psis).*(sqrt(psip-psi)-sqrt(psip-psis));
F = F1 + F2 + F3 + F4 + F5; 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
j = find(F>=-1.0E-6);
% ------------------------------------------------------------------------
figure(1)
plot(psi(min(j):end),F(min(j):end),'linewidth',2.0); grid on, hold on
plot(psi(min(j)),F(min(j)),'.','markersize',15); grid on, hold on
legend('\alpha_{0}=1.6','','\alpha_{0}=1.643','','\alpha_{0}=2.0','','\alpha_{0}=2.097','','\alpha_{0}=2.2','','Location','best')
xlim([0.0 3.0])
xlabel('\Psi'), ylabel('F(\Psi,\Psi_{s})')



