
function f = find_xdata(xdata, alpha0)
% Since the function 'find' gets it difficult to evaluate the non-integer
% values , we use the following tolerance style.
    f = find(abs(xdata-alpha0) < 0.001);    
end