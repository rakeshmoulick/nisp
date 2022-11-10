
function f = sub(psis)
global alpha0 gamma delta psip mn m1p n2ps_ne0
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
C1 = exp(-psis) + alpha0*exp(-gamma*psis);
% ------------------------------------------------------------------------
n1ps_ne0 = (C1-n2ps_ne0)/(1-delta*sqrt(mn/m1p)*sqrt(psis/(psip-psis)));
% ------------------------------------------------------------------------
fun = n1ps_ne0*(1.0/psis)*(1+delta*sqrt(mn/m1p)*sqrt((psis/(psip-psis))^3)) + n2ps_ne0*(1.0/psis) - 2*exp(-psis) - 2*alpha0*gamma*exp(-gamma*psis);  
% ------------------------------------------------------------------------
f = fun;
end