
function f = sub(psis)
global alpha0 gamma delta psip mn m1p
% % ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
% C1 = exp(-psis) + alpha0*exp(-gamma*psis);
% % ------------------------------------------------------------------------
% C2 = 2*psis*exp(-psis) + 2*alpha0*gamma*psis*exp(-gamma*psis);
% % ------------------------------------------------------------------------
% K = delta*sqrt(mn/m1p)*(sqrt(psis/(psip-psis)) + (psis/(psip-psis))^(3/2));
% % ------------------------------------------------------------------------
% n1ps_ne0 = (C2-C1)./K;
% % ------------------------------------------------------------------------
% n2ps_ne0 = C1 - (1-delta*sqrt(psis/(psip-psis)))*n1ps_ne0;
% % ------------------------------------------------------------------------   
C1 = exp(-psis) + alpha0*exp(-gamma*psis);    
C2 = 2*psis.*exp(-psis) + 2*alpha0*gamma*psis.*exp(-gamma*psis);
K = delta*sqrt(mn/m1p)*(sqrt(psis/(psip-psis)) + (psis/(psip-psis)).^(3/2));
n1ps_ne0 = (C2-C1)./K;
n2ps_ne0 = C1 - (1 - delta*sqrt(mn/m1p)*sqrt(psis/(psip-psis)))*n1ps_ne0;
fun = n1ps_ne0*(1.0/psis)*(1+delta*sqrt(mn/m1p)*sqrt((psis/(psip-psis))^3)) + n2ps_ne0*(1.0/psis) - 2*exp(-psis) - 2*alpha0*gamma*exp(-gamma*psis);  
% ------------------------------------------------------------------------
f = fun;
end