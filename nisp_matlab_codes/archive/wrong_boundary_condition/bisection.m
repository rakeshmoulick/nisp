
clc; clearvars;
%global gamma alpha0 mn m1p delta psip
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
x0 = 0.0;
x1 = 0.1;
epsilon = 0.00001;
disp([b_sub(x0), b_sub(x1)])
if (b_sub(x0)*b_sub(x1) > 0)
    disp([b_sub(x0), b_sub(x1)])
    disp('Enter a valid interval')
    return
else
    x2 = (x0 + x1)/2;
    err = abs(x1-x0);
    while err>epsilon
        if (b_sub(x0)*b_sub(x2) < 0)
            x1 = x2;
        else
            x0 = x2;
        end
        x2 = (x0+x1)/2;
        err = abs(x2-x1);
        root = x2;
    end
        fprintf('The root is %4.3f \n', root);
end