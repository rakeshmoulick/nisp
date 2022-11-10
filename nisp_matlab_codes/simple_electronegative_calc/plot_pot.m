
% Code Description: Plots the potential for a simple electronegative plasma 
% containing one species of positive ion, electrons and negative ions, from 
% different mat files as per requirement.
% Function Invoked: None
% Note: The input mat files required for this file are generated from
% 'drv_F.m' and 'drv_pot.m' files. 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
clc; clearvars;
alpha0 = input('Enter the value of alpha0: ');
filename1 = ['pot_F_alpha_',num2str(alpha0,'%.3f'),'.mat'];
filename2 = ['pot_poisson_alpha_',num2str(alpha0,'%.3f'),'.mat'];
if (alpha0 == 1.500 || alpha0 == 1.849 || alpha0 == 2.000)
    load(filename1)
elseif (alpha0 == 1.569 || alpha0 == 1.750)
    load(filename2)
end
% ------------------------------------------------------------------------
figure(1)
plot(x,y(:,1),'linewidth',2.0), grid on, hold on
xlabel('X'), ylabel('\Psi')
xlim([-50 0]), ylim([0 5])
legend('\alpha_{0}=1.5','\alpha_{0}=1.569','\alpha_{0}=1.75','\alpha_{0}=1.849','\alpha_{0}=2.0','Location','best')
% ------------------------------------------------------------------------
% Calculate Space Charge and Plot
sigma = N1 - Ne - Nn;
% ------------------------------------------------------------------------
figure(2)
plot(x,sigma,'linewidth',2.0), grid on, hold on
xlabel('X'), ylabel('\sigma')
xlim([-50 0])
legend('\alpha_{0}=1.5','\alpha_{0}=1.569','\alpha_{0}=1.75','\alpha_{0}=1.849','\alpha_{0}=2.0','Location','best')

