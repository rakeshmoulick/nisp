% Code Description: Finds the multivalued range of alpha0 for a given 
% electronegative plasma contining two species of positive ions, electrons 
% and volume & surface produced negative ions.
% Function Invoked: single_multiple.m 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
clc; clearvars;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alphaEnd = 12.0;
alphaIncrement = 0.001;
delta = 0.4;
n2ps_ne0 = 0.2;
filename = ['./psis_data/psis_alpha_',num2str(alphaEnd,'%.3f'),'_increment_',...
    num2str(alphaIncrement,'%.3f'),'_delta_',num2str(delta,'%.1f'),'_n2ps_',num2str(n2ps_ne0,'%.1f'),'.mat'];
load(filename)
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Check whether n1ps_ne0 is negative for the given parameter set
% ------------------------------------------------------------------------
f = sub_density(psis, gamma, alpha0, psip, delta, n2ps_ne0);
if f==1
    fprintf('n1ps_ne0 is negative: f=%d\n',f);
    return;
else
    fprintf('n1ps_ne0 is positive: f=%d\n',f);
end
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Note: If the value of alphaIncrement is reduced further, then reduce the
% tolerance level of 'single_multiple.m' and 'find_xdata.m'
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% load command loads all parameter values. However, alpha0 must be changed
% to 0. The interval of alpha increment must be kept same as 'drv_sub.m' file.
alpha0 = 0.0; 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Create empty arrays to hold the single and multiple valued alpha. 
single_alpha = []; % List to hold all single valued alpha
multiple_alpha = []; % List to hold all single valued alpha
% Loop over all alpha
while alpha0<=alphaEnd
    [s,m] = single_multiple(xdata, ydata, alpha0);
    single_alpha(end+1)=s;
    multiple_alpha(end+1)=m;
    alpha0 = alpha0 + alphaIncrement;
end
% -------------------------------------------------------------------------
% print the first and last multiple values of alpha
index = find(not(isnan(multiple_alpha))); 
m_alpha_1 = multiple_alpha(index(1));
m_alpha_2 = multiple_alpha(index(end));
% -------------------------------------------------------------------------
fprintf('The first and last multiple values of alpha are respectively: %f and %f\n',m_alpha_1, m_alpha_2); 
fprintf('The difference between the values is %f\n',m_alpha_2-m_alpha_1)

