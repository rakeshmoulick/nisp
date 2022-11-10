
clc; clearvars;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alpha0 = input('Enter the value of alpha0: '); 
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
gamma = 15;
psis = 0:0.001:1;
C1 = exp(-psis) + alpha0*exp(-gamma*psis);
n1ps_ne0 = C1;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Jp = n1ps_ne0.*sqrt(psis);
[pks,locs] = findpeaks(Jp,psis);
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
figure(1)
plot(psis,Jp,'linewidth',2.0),grid off, hold on
% ------------------------------------------------------------------------
%findpeaks(Jp,psis); % Display the peaks and plot the graph
% ------------------------------------------------------------------------
for i=1:length(pks)
    x = locs(i);
    y = pks(i);
    %line([x x],[0 y],'color','red','linewidth',1.5)
    plot(x,y,'o','markersize',8,'markerfacecolor','g','MarkerEdgeColor','k','linewidth',1.5)
end
xlim([0.0 1.0])
ylim([0.38,0.45])
xlabel('\Psi'),ylabel('J_{+}')
set(gca,'ytick',[]) % Do not show the y-value, similarly can be done for x-axis also.
legend('\alpha_{0}=0.0','','\alpha_{0}=1.5','','\alpha_{0}=1.569','','', ...
    '\alpha_{0}=1.75','','','\alpha_{0}=1.849','','','\alpha_{0}=1.975','','','\alpha_{0}=2.0','','')

