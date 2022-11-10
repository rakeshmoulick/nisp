
function [single_value, multiple_value] = single_multiple(xdata, ydata, alpha0)
    % --------------------------------------------------------------------
    % The code finds & segregates the value of alpha0 for which the ydata 
    % (i.e. psis) is multi-valued.
    % --------------------------------------------------------------------
    % mi are the indices of xdata for which ydata is multi-valued
    mi = find_xdata(xdata,alpha0);
    
    % find the 'ydata' corresponding to all multiple 'xdata' 
    multiple_ydata = ydata(mi);
    
    % find the lowest 'ydata' out of all these multiple-ydata
    % lowest_ydata = min(multiple_ydata);
    
    % Find the number of nan in multiple_ydata
    % nn = isnan(multiple_ydata);
    
    % Find the indices of multiple_ydata which are non-nan
    m = find(not(isnan(multiple_ydata))); 
    
    % Compare the values of non-nan indices in multi_ydata and obtain the 
    % boolean result. If all values are true then ydata is single valued, 
    % otherwise ydata is multiple valued.   
    tol = 0.001;
    K1 = multiple_ydata(m(1));
    k = abs(multiple_ydata(m(1):m(end)) - K1)<tol;
    if (k==1)
        % Capture the value of 'alpha0' for which 'psis' is single-valued
        single_value = alpha0;
        multiple_value = nan;
    else
        % capture the value of 'alpha0' for which 'psis' is multi-valued
        multiple_value = alpha0;
        single_value = nan;
    end   
end