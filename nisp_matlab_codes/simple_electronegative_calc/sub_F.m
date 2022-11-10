
function dy = sub_F(x,y)
    global psis gamma alpha0
    dy = zeros(1,1);
    C1 = exp(-psis) + alpha0*exp(-gamma*psis);
    n1ps_ne0 = C1;
    % --------------------------------------------------------------------
    F1 = 4*n1ps_ne0.*(sqrt(psis*y(1))-psis);
    F2 = 2*(exp(-y(1))-exp(-psis));
    F3 = (2*alpha0/gamma).*(exp(-gamma*y(1))-exp(-gamma*psis));
    F = F1 + F2 + F3;
    % --------------------------------------------------------------------
    dy(1) = abs(sqrt(abs(F)));
    %disp([x F])
end