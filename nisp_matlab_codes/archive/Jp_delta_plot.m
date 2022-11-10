
% Plots the current desities for delta variation. Data obtained from the
% matfiles. The matfiles are obtained by running the file 'Jp_delta.m'.
clc; clearvars;
load delta_0.2.mat 
J1_data1 = J1;
J2_data1 = J2;
Jp_data1 = Jp;

load delta_0.8.mat
J1_data2 = J1;
J2_data2 = J2;
Jp_data2 = Jp;

% +++++++++++++++++++++++ Plotting +++++++++++++++++++++++++++++++++++++++
plot(psis, Jp_data1,"k","LineStyle","-","LineWidth",2.0), hold on
plot(psis, Jp_data2,"r","LineStyle","--","LineWidth",2.0), hold on
xlabel("\Psi_{s}"), ylabel("J_{+}")
grid on
legend('\delta=0.2','\delta=0.8','location','southwest')
% ----------------------------------------------------------------------   
ax2 = axes('Position',[0.4 0.6 0.2 0.3]);
plot(psis,J1_data1,"k","LineStyle","-","LineWidth",2.0), hold on
plot(psis,J1_data2,"r","LineStyle","--","LineWidth",2.0), hold on 
set(ax2,'box','on')
set(get(ax2, 'xlabel'), 'fontname', 'times')
set(get(ax2, 'ylabel'), 'fontname', 'times')
xlabel('\Psi_{s}');ylabel('J_{1}')
%---------------------------------------------------------------------
%axes('Psition',[xstart ystart xend-xstart yend-ystart])    
ax3 = axes('Position',[0.68 0.6 0.2 0.3]);
plot(psis,J2_data1,"k","LineStyle","-","LineWidth",2.0), hold on
plot(psis,J2_data2,"r","LineStyle","--","LineWidth",2.0), hold on
set(ax3,'box','on')
set(get(ax3, 'xlabel'), 'fontname', 'times')
set(get(ax3, 'ylabel'), 'fontname', 'times')
xlabel('\Psi_{s}');ylabel('J_{2}')
