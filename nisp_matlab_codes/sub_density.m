
function f = sub_density(psis, gamma, alpha0, psip, delta, n2ps_ne0)
f = false;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
AMU = 1.67E-27;
mn=1*AMU;
m1p = 1*AMU;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
C1 = exp(-psis) + alpha0*exp(-gamma*psis);
D = (1-delta*sqrt(mn/m1p).*sqrt(psis./(psip-psis)));
n1ps_ne0 = (C1-n2ps_ne0)./D;
if n1ps_ne0<0
    f = true;
end
% fprintf("C1=%f\n",C1);
% fprintf("Denominator=%f\n",D);
% fprintf("n1ps_ne0=%f\n",n1ps_ne0);
% fprintf("density sum=%f\n",n1ps_ne0+n2ps_ne0);
end
