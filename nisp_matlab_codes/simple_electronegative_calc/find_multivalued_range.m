
% Code Description: Finds the multivalued range of alpha0 for a simple 
% electronegative plasma contining one species of positive ion, electrons 
% and negative ions.
% Function Invoked: single_multiple.m 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
clc; clearvars;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alphaEnd = 6.0;
alphaIncrement = 0.001;
filename = ['psis_alpha_',num2str(alphaEnd,'%.3f'),'_increment_',num2str(alphaIncrement,'%.3f'),'.mat'];
load(filename)
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
% ------------------------------------------------------------------------
% Loop over all alpha
while alpha0<=alphaEnd
    [s,m] = single_multiple(xdata, ydata, alpha0);
    single_alpha(end+1)=s;
    multiple_alpha(end+1)=m;
    alpha0 = alpha0 + alphaIncrement;
end
% ------------------------------------------------------------------------
% print the first and last multiple values of alpha
index = find(not(isnan(multiple_alpha))); 
m_alpha_1 = multiple_alpha(index(1));
m_alpha_2 = multiple_alpha(index(end));
% -------------------------------------------------------------------------
fprintf('The first and last multiple values of alpha are respectively: %f and %f\n',m_alpha_1, m_alpha_2); 
fprintf('The difference between the values is %f\n',m_alpha_2-m_alpha_1)


