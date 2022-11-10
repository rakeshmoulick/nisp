% Code Description: Solves the transcendental equation to find the root
% psis, where, psis is the electric potential at the sheath edge. This code 
% is for two species of positive ions, electrons, volume and surface produced 
% negative ions. 'delta' and 'n2ps_ne0' are usually kept fixed.
% Function Invoked: sub.m 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
clc; clearvars;
global alpha0 gamma delta psip mn m1p n2ps_ne0
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
AMU = 1.67E-27;
mn=1*AMU;
m1p = 1*AMU;
% ------------------------------------------------------------------------
gamma = 15;
alpha0 = 0.0; % alpha0 to be looped over
psip = 5;
delta = 0.4;
n2ps_ne0 = 0.2;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alphaEnd = input('Enter the final alpha till which looping required:');
alphaIncrement = input('Enter the incremental value of alpha (0.01 or 0.001):');
% Hint: Choose alphaEnd = 5 or 6 etc. for alphaIncrement = 0.001 and 
% alphaEnd = 100 for alphaIncrement = 0.01. Else, it will take longer runtime. 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Initial Value to start root finding [choose as 0.1, 0.3, 0.5]
iniValue = [0.01, 0.1, 0.2, 0.3, 0.5, 0.6]; 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% create empty list to hold the data values 
xdata = zeros(); 
ydata = zeros();
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
i = 1; % index of 'xdata' and 'ydata'
% Loop over alpha0
while (alpha0 <= alphaEnd)
    % Use the initial values as 0.1, 0.3 and 0.5 respectively for
    % multivaled solutions
    for j = 1:length(iniValue)
        options = optimset('TolX',1E-5);
        psis = fzero(@(psis)sub(psis),iniValue(j));
        xdata(i) = alpha0;
        ydata(i) = psis;
        i = i+1;   
    end
    alpha0 = alpha0 + alphaIncrement; % alphaIncrement is the interval of increment of alpha0        
end    
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Omit the values of ydata which are zero
for k = 1:length(ydata)
    if(ydata(k) <0.0001) % Put the roots greater than 0.6 to NaN ( add '|| ydata(k)>0.6')
        ydata(k) = NaN;
    end
end
%+++++++++++++++++++++++++++++ Plot graph ++++++++++++++++++++++++++++++++ 
% figure(1)
% semilogx(xdata,ydata,'o','Markersize',2,'MarkerfaceColor','r','MarkerEdgeColor','none'), grid on, hold on
% xlabel('\alpha_{0}'), ylabel('\Psi_{s}')
% axis([0 100 0.0 0.8])

% +++++++++++++++++++++ Save MAT File +++++++++++++++++++++++++++++++++++
% filename = ['./gamma_var/psis_gamma_',num2str(gamma,'%d'),'_n2ps_ne0_',num2str(n2ps_ne0,'%.1f'),'_delta_',num2str(delta,'%.1f'),'.mat'];
% -------------------------------------------------------------------------
% filename = ['./psis_n2ps_var/test_psis_n2ps_ne0_',num2str(n2ps_ne0,'%.1f'),'_delta_',num2str(delta,'%.1f'),'.mat'];
% save(filename)
% -------------------------------------------------------------------------
filename = ['./psis_data/psis_alpha_',num2str(alphaEnd,'%.3f'),'_increment_',...
    num2str(alphaIncrement,'%.3f'),'_delta_',num2str(delta,'%.1f'),'_n2ps_',num2str(n2ps_ne0,'%.1f'),'.mat'];
save(filename)



