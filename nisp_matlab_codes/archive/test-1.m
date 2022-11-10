
clc; clearvars;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% x = [0 1 1 2 3 4 4 5 6 7 7 8 9 9 10];
% y = [1 2 1 3 4 5 5 7 8 8 9 5 6 4 2];
% plot(x,y,'ro-','MarkerSize',15)
% [ux, i, j] = unique(x,'sorted');
% doubleIndex = find(not(ismember(1:numel(x),i)));
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
load psis.mat
% Check whether the xdata is sorted
sortx = issorted(xdata); % 1 = Sorted; 0 = Not-Sorted

% Find the uniques values and indices of the xdata
[ux,i,j]=unique(xdata,"sorted");

% mi are the double/multiple entry indices of xdata
mi = find(not(ismember(1:numel(xdata),i)));

% find the 'ydata' corresponding to all double/multiple 'xdata' 
multiple_ydata = ydata(mi);

% find the lowest 'ydata' 









