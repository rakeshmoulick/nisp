
% Code Description: Solves the transcendental equation to find the root
% psis, where, psis is the electric potential at the sheath edge. This is 
% for a simple electronegative plasma contining one species of positive ion, 
% electron and negative ions.
% Function Invoked: sub.m 
% -------------------------------------------------------------------------
clc; clearvars;
global alpha0 gamma psip
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
AMU = 1.67E-27;  % Atomic Mass Unit
mn=1*AMU;        % Mass of the negative ion
m1p = 1*AMU;     % Mass of the positive ions
% ------------------------------------------------------------------------
gamma = 15; % Ratio of electron to negative ion temperature
alpha0 = 0.0; % Ration of the negative ion to electron densty. alpha0 to be looped over
psip = 5; % Applied plate potential
alphaEnd = input('Enter the final alpha till which looping required:');
alphaIncrement = input('Enter the incremental value of alpha (0.01 or 0.001):');
% Hint: Choose alphaEnd = 5 or 6 etc. for alphaIncrement = 0.001 and 
% alphaEnd = 100 for alphaIncrement = 0.01. Else, it will take longer runtime. 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Initial Value to start root finding [choose as 0.01, 0.1, 0.2, 0.3, 0.5, 0.6]
iniValue = [0.01, 0.1, 0.2, 0.3, 0.5, 0.6]; 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% create empty list to hold the data values 
xdata = zeros(); % List to hold alpha0
ydata = zeros(); % List to hold psis
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
    alpha0 = alpha0 + alphaIncrement;  % alphaIncrement is the interval of increment of alpha0
end    
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Omit the values of ydata which are zero
for k = 1:length(ydata)
    if(ydata(k) <0.0001) % Put the roots greater than 0.6 to NaN ( add '|| ydata(k)>0.6')
        ydata(k) = NaN;
    end
end
% +++++++++++++++++++++ Save AS MAT File +++++++++++++++++++++++++++++++++
filename = ['psis_alpha_',num2str(alphaEnd,'%.3f'),'_increment_',num2str(alphaIncrement,'%.3f'),'.mat'];
%filename = ['psis','.mat'];
save(filename)  




