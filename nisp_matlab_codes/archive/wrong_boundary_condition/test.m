
clc; clearvars; 
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
gamma = 15;
alpha0 = 10.0; 
psip = 1;
AMU = 1.67E-27;
mn=1*AMU;
m1p = 1*AMU;
delta = 1;
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
psis = 0.3;
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
n = input('Enter 1 for method-1 and 2 for method-2:'); 
if n==1
    for i = 1:length(psis) 
        C1 = exp(-psis(i)) + alpha0*exp(-gamma*psis(i));    
        C2 = 2*psis(i).*exp(-psis(i)) + 2*alpha0*gamma*psis(i).*exp(-gamma*psis(i));
        K = delta*sqrt(mn/m1p)*(sqrt(psis(i)/(psip-psis(i))) + (psis(i)/(psip-psis(i))).^(3/2));
        n1ps_ne0 = (C2-C1)./K;
        n2ps_ne0 = C1 - (1 - delta*sqrt(mn/m1p)*sqrt(psis(i)/(psip-psis(i))))*n1ps_ne0;
        % ------------------------------------------------------------------------
        f1 = n1ps_ne0*(1.0/psis(i))*(1+delta*sqrt(mn/m1p)*sqrt((psis(i)/(psip-psis(i)))^3));
        f2 = n2ps_ne0*(1.0./psis(i));
        f3 = 2*exp(-psis(i));
        f4 = 2*alpha0*gamma*exp(-gamma*psis(i));
        fun = f1 + f2 - f3 - f4;
    end
elseif n==2
    C1 = exp(-psis) + alpha0*exp(-gamma*psis);    
    C2 = 2*psis.*exp(-psis) + 2*alpha0*gamma*psis.*exp(-gamma*psis);
    K = delta*sqrt(mn/m1p)*(sqrt(psis/(psip-psis)) + (psis/(psip-psis)).^(3/2));
    %n1ps_ne0 = (C2-C1)./K;
    %n2ps_ne0 = C1 - (1 - delta*sqrt(mn/m1p)*sqrt(psis/(psip-psis)))*n1ps_ne0;
    n2ps_ne0 = 0.2;
    n1ps_ne0 = (C1-n2ps_ne0)/(1 - delta*sqrt(mn/m1p)*sqrt(psis/(psip-psis)));
    % ------------------------------------------------------------------------
    f1 = n1ps_ne0.*(1.0./psis).*(1+delta.*sqrt(mn/m1p).*sqrt((psis./(psip-psis)).^3));
    f2 = n2ps_ne0.*(1.0./psis);
    f3 = 2*exp(-psis);
    f4 = 2*alpha0*gamma.*exp(-gamma.*psis);
    fun = f1 + f2 - f3 - f4;
end
% ------------------------------------------------------------------------
disp([f1 f2 f3 f4])
disp([n1ps_ne0, n2ps_ne0])
disp(fun)