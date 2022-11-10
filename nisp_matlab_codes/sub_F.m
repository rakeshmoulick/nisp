
function dy = sub_F(x,y)
    global psis gamma alpha0 delta n2ps_ne0 mn m1p psip
    dy = zeros(1,1);
    % -------------------------------------------------------------------
    C1 = exp(-psis) + alpha0*exp(-gamma*psis);
    D = (1-delta*sqrt(mn/m1p).*sqrt(psis./(psip-psis)));
    n1ps_ne0 = (C1-n2ps_ne0)./D;
    % --------------------------------------------------------------------
    F1 = 4*n1ps_ne0.*(sqrt(psis*y(1))-psis);
    F2 = 4*n2ps_ne0*(sqrt(psis.*y(1))-psis);
    F3 = 2*(exp(-y(1))-exp(-psis));
    F4 = (2*alpha0/gamma).*(exp(-gamma*y(1))-exp(-gamma*psis));
    F5 = 4*delta*n1ps_ne0*sqrt(mn/m1p).*sqrt(psis).*(sqrt(psip-y(1))-sqrt(psip-psis));
    F = F1 + F2 + F3 + F4 + F5; 
    % --------------------------------------------------------------------
    dy(1) = sqrt(F);    
%     if(~isreal(F))
%        disp('F is imaginary or NaN') 
%         %disp([x F])
%     end
end