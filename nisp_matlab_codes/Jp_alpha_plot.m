% Code Description: Plotter file for the positive ion current density (Jp).
% Dependency: First run 'Jp_alpha.m', and generate the corresponding '.mat' file.
% The mat file is read from 'Jp_alpha_var' folder.
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
clc; clearvars;
alpha0 = input('Enter the value of alpha0: '); 
delta = 0.4;
n2ps_ne0 = 0.2;
filename = ['./Jp_alpha_var/Jp_alpha_',num2str(alpha0,'%.3f'),'_delta_',num2str(delta,'%.1f'),'_n2ps_ne0_',num2str(n2ps_ne0,'%.1f'),'.mat'];
load(filename)
%[pks,locs] = findpeaks(Jp,psis);
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
figure(1)
plot(psis,Jp,'linewidth',2.0),grid off, hold on
% ------------------------------------------------------------------------
%findpeaks(Jp,psis); % Display the peaks and plot the graph
% if length(pks) > 1
%     fprintf('The difference between the peaks = %f\n',pks(2)-pks(1));
% end
% ------------------------------------------------------------------------
% for i=1:length(pks)
%     x = locs(i);
%     y = pks(i);
%     %line([x x],[0 y],'color','red','linewidth',1.5)    
%     plot(x,y,'o','markersize',8,'markerfacecolor','g','MarkerEdgeColor','k','linewidth',1.5) 
%     if (alpha0==alpha0)
%         line([0 1],[y y],'color','r','linewidth',1.5), hold on
%     end
% end

xlim([0.0 1.0])
ylim([0.38,0.6])
xlabel('\Psi'),ylabel('J_{+}')
%set(gca,'ytick',[]) % Do not show the y-value, similarly can be done for x-axis also.
% legend('\alpha_{0}=0.0','','\alpha_{0}=1.6','','\alpha_{0}=1.643','','', ...
%     '\alpha_{0}=2.0','','','\alpha_{0}=2.097','','','','','\alpha_{0}=2.2','','')



% % ++++++++++++++++ ADDING SUBFIGURES =====++++++++++++++++++++++++++++++
% % axes('Position',[xstart ystart xend-xstart yend-ystart])    
% ax2 = axes('Position',[0.4 0.6 0.2 0.3]);
% plot(psis,J1,'linewidth',2.0),grid off, hold on
% set(ax2,'box','on')
% set(get(ax2, 'xlabel'), 'fontname', 'times')
% set(get(ax2, 'ylabel'), 'fontname', 'times')
% xlabel('\Psi');ylabel('J_{1}')
% % ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% ax3 = axes('Position',[0.68 0.6 0.2 0.3]);
% plot(psis,J2,'linewidth',2.0),grid off, hold on
% set(ax3,'box','on')
% set(get(ax3, 'xlabel'), 'fontname', 'times')
% set(get(ax3, 'ylabel'), 'fontname', 'times')
% xlabel('\Psi');ylabel('J_{2}')
% % ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
