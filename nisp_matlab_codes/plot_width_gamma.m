
clc; clearvars;
g = [];
w = [];
n2ps_ne0 = 0.2;
delta = 0.0;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
for i =1:21
    %filename = ['./psis_gamma_var/psis_gamma_',num2str(i+9,'%d'),'.mat'];
    filename = ['./gamma_var/psis_gamma_',num2str(i+9,'%d'),'_n2ps_ne0_',num2str(n2ps_ne0,'%.1f'),'_delta_',num2str(delta,'%.1f'),'.mat'];
    load(filename)
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
    %disp('The first and last multiple values of alpha are respectively:')
    %disp([m_alpha_1, m_alpha_2])
    %disp(m_alpha_2-m_alpha_1)
    g(end+1) = gamma;
    w(end+1) = m_alpha_2 - m_alpha_1;
end
% Plot Figure
plot(g, w, 'k','linewidth', 2, 'LineStyle','-','marker','o','markersize',10,'markerfacecolor','g','markeredgecolor','k')
grid on
xlabel('\gamma')
ylabel('\Delta\alpha_{0}')