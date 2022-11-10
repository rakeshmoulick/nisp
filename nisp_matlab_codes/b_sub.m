
function f = b_sub(psis)
%global gamma alpha0 mn m1p delta psip
gamma = 15;
alpha0 = 50.0; 
psip = 5;
AMU = 1.67E-27;
mn=1*AMU;
m1p = 1*AMU;
delta = 0.2;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
C1 = exp(-psis) + alpha0*exp(-gamma*psis);
% ------------------------------------------------------------------------
% C2 = 2*psis*exp(-psis) + 2*alpha0*gamma*psis*exp(-gamma*psis);
% ------------------------------------------------------------------------
% K = delta*sqrt(mn/m1p)*(sqrt(psis/(psip-psis)) + (psis/(psip-psis))^(3/2));
% ------------------------------------------------------------------------
% n1ps_ne0 = (C2-C1)./K;
% ------------------------------------------------------------------------
% n2ps_ne0 = C1 - (1-delta*sqrt(psis/(psip-psis)))*n1ps_ne0;
% ------------------------------------------------------------------------   
% C1 = exp(-psis) + alpha0*exp(-gamma*psis);    
% C2 = 2*psis.*exp(-psis) + 2*alpha0*gamma*psis.*exp(-gamma*psis);
% K = delta*sqrt(mn/m1p)*(sqrt(psis/(psip-psis)) + (psis/(psip-psis)).^(3/2));
% n1ps_ne0 = (C2-C1)./K;
% n2ps_ne0 = C1 - (1 - delta*sqrt(mn/m1p)*sqrt(psis/(psip-psis)))*n1ps_ne0;
% disp([n1ps_ne0, n2ps_ne0, sqrt(mn/m1p)]);
% ------------------------------------------------------------------------
n1ps_ne0 = (C1-n2ps_ne0)/(1-delta*sqrt(mn/m1p)*sqrt(psis/(psip-psis)));
% ------------------------------------------------------------------------
f = n1ps_ne0*(1.0/psis)*(1+delta*sqrt(mn/m1p)*sqrt((psis/(psip-psis))^3)) + n2ps_ne0*(1.0/psis) - 2*exp(-psis) - 2*alpha0*gamma*exp(-gamma*psis);  
% ------------------------------------------------------------------------
disp(f)
end