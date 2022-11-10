clc; clearvars;

clc; clearvars;
load alpha_0.0.mat 
J1_data1 = J1;
J2_data1 = J2;
Jp_data1 = Jp;

load alpha_1.0.mat
J1_data2 = J1;
J2_data2 = J2;
Jp_data2 = Jp;

load alpha_2.0.mat
J1_data3 = J1;
J2_data3 = J2;
Jp_data3 = Jp;

load alpha_5.0.mat
J1_data4 = J1;
J2_data4 = J2;
Jp_data4 = Jp;
% +++++++++++++++++++++++ Plotting +++++++++++++++++++++++++++++++++++++++
plot(psis, Jp_data1,"k","LineStyle","-","LineWidth",2.0), hold on
plot(psis, Jp_data2,"k","LineStyle","--","LineWidth",2.0), hold on
plot(psis, Jp_data3,"k","LineStyle","-.","LineWidth",2.0), hold on
plot(psis, Jp_data4,"k","LineStyle",":","LineWidth",2.0), hold on
xlabel("\Psi_{s}"), ylabel("J_{+}")
grid on
legend('\alpha_{0}=0.0','\alpha_{0}=1.0','\alpha_{0}=2.0','\alpha_{0}=5.0','location','southwest')
% ----------------------------------------------------------------------   
ax2 = axes('Position',[0.4 0.6 0.2 0.3]);
plot(psis,J1_data1,"k","LineStyle","-","LineWidth",2.0), hold on
plot(psis,J1_data2,"k","LineStyle","--","LineWidth",2.0), hold on 
plot(psis,J1_data3,"k","LineStyle","-.","LineWidth",2.0), hold on
plot(psis,J1_data4,"k","LineStyle",":","LineWidth",2.0), hold on
set(ax2,'box','on')
set(get(ax2, 'xlabel'), 'fontname', 'times')
set(get(ax2, 'ylabel'), 'fontname', 'times')
xlabel('\Psi_{s}');ylabel('J_{1}')
%---------------------------------------------------------------------
%axes('Psition',[xstart ystart xend-xstart yend-ystart])    
ax3 = axes('Position',[0.68 0.6 0.2 0.3]);
plot(psis,J2_data1,"k","LineStyle","-","LineWidth",2.0), hold on
plot(psis,J2_data2,"k","LineStyle","--","LineWidth",2.0), hold on
plot(psis,J2_data3,"k","LineStyle","-.","LineWidth",2.0), hold on
plot(psis,J2_data4,"k","LineStyle",":","LineWidth",2.0), hold on
set(ax3,'box','on')
set(get(ax3, 'xlabel'), 'fontname', 'times')
set(get(ax3, 'ylabel'), 'fontname', 'times')
xlabel('\Psi_{s}');ylabel('J_{2}')
