
clc; clearvars;
g = [];
w = [];
n2ps_ne0 = 0.8;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
for i =1:4    
    if(i==1)
        delta = 0.0;
    elseif(i==2)
        delta = 0.2;
    elseif(i==3)
        delta = 0.5;
    elseif(i==4)
        delta = 0.8;
    end
    % --------------------------------------------------------------------
    filename = ['./psis_n2ps_var/psis_n2ps_ne0_',num2str(n2ps_ne0,'%.1f'),'_delta_',num2str(delta,'%.1f'),'.mat'];
    %filename = ['./psis_gamma_var/psis_gamma_',num2str(i+9,'%d'),'.mat'];
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
    g(end+1) = delta;
    w(end+1) = m_alpha_2 - m_alpha_1;
end
% Plot Figure
plot(g, w,'linewidth', 2, 'LineStyle','-','marker','o','markersize',10,'markerfacecolor','g','markeredgecolor','k')
grid on, hold on
xlabel('\delta')
ylabel('\Delta\alpha_{0}')
legend('(n_{2+})_{s}/n_{e0}=0.0','(n_{2+})_{s}/n_{e0}=0.2','(n_{2+})_{s}/n_{e0}=0.5','(n_{2+})_{s}/n_{e0}=0.8')