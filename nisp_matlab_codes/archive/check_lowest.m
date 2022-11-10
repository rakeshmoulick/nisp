clc; clearvars;
load psis.mat
alpha0 = 5.0;

% mi are the multiple entry indices of xdata
mi = find_xdata(xdata,alpha0);

% find the 'ydata' corresponding to all multiple 'xdata' 
multiple_ydata = ydata(mi);

% find the lowest 'ydata' outof all these ydata
lowest_ydata = min(multiple_ydata);

% Find the number of nan in multiple_ydata
% nn = isnan(multiple_ydata);

% Find the indices of multiple_ydata which are non-nan
m = find(not(isnan(multiple_ydata))); 

% Create empty array of elements for 'single-valued-alpha' and 
% 'multiple-valued-alpha' data holder 
s_alpha0(end+1) = []; 
m_alpha0(end+1) = []; 

% Compare the values of non-nan indices in multiple_ydata and obtain the 
% boolean result. If all values are true then ydata is single valued, 
% otherwise ydata is multiple valued.   
tol = 0.001;
K1 = multiple_ydata(m(1));
k = abs(multiple_ydata(m(1):m(end)) - K1)<tol;
if (k==1)
    % Capture the value of 'alpha0' here for which 'psis' is single valued
    s_alpha0(end+1) = alpha0; 
    disp('ydata is single valued')
else
    % capture the value of 'alpha0' here for which 'psis' is multiple valued
    m_alpha0(end+1) = alpha0; 
    disp('ydata is multiple valued')
    disp(multiple_ydata(m(1):m(end)))
    %disp('The lowest among the multiple valued ydata is:')
    %disp(min(multiple_ydata(m(1):m(end))));
end
% The aim is to find the range/value of alpha0 for which the ydata is multiple
% valued.