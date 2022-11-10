
function f = find_xdata(xdata, alpha0)
% Since the function 'find' gets it difficult to evaluate the non-integer
% values , we use the following tolerance style.
    tol = 0.0001;
    f = find(abs(xdata-alpha0) < tol);    
end