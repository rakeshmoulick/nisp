
clc; clearvars;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
load ./psis_gamma_var/psis_gamma_15.mat
% load psis.mat loads all parameter values. However, alpha0 must be changed
% to 0. The interval of alpha increment must be kept same as 'drv_sub.m' file.
alpha0 = 0.0; 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Create empty arrays to hold the single and multiple valued alpha. 
single_alpha = [];
multiple_alpha = [];
% Loop over all alpha
while alpha0<=100
    [s,m] = single_multiple(xdata, ydata, alpha0);
    single_alpha(end+1)=s;
    multiple_alpha(end+1)=m;
    alpha0 = alpha0 + 0.01;
end
% print the first and last multiple values of alpha
index = find(not(isnan(multiple_alpha))); 
m_alpha_1 = multiple_alpha(index(1));
m_alpha_2 = multiple_alpha(index(end));
disp('The first and last multiple values of alpha are respectively:')
disp([m_alpha_1, m_alpha_2])
disp(m_alpha_2-m_alpha_1)
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Plot graph
figure(1)

%Plot the graph on top of the colored area
semilogx(xdata,ydata,'o','Markersize',2,'MarkerfaceColor','r','MarkerEdgeColor','None'), grid on, hold on
x1=[m_alpha_1, m_alpha_1]; x2=[m_alpha_2, m_alpha_2];
y1=[0.0, 0.8]; y2=[0.0, 0.8];
line(x1,y1,'Color','r','LineStyle','--','linewidth',2), hold on
line(x2,y2,'Color','r','LineStyle','--','linewidth',2), hold on
xlabel('\alpha_{0}'), ylabel('\Psi_{s}')
axis([min(xdata) 100 0.0 0.8])

%Color fill the multiple valued area of the graph
%x_fill = [m_alpha_1; m_alpha_1; m_alpha_2; m_alpha_2];
%y_fill = [0; 0.8; 0.8; 0];
%fill (x_fill, y_fill, 'c')
%semilogx(xdata,ydata,'o','Markersize',2,'MarkerfaceColor','r','MarkerEdgeColor','None'), grid on, hold on
% ------------------------------------------------------------------------