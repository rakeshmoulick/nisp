clc; clearvars;
global alpha0 gamma delta psip mn m1p
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
gamma = 15;
alpha0 = 0.0; % alpha0 to be looped over
psip = 5;
AMU = 1.67E-27;
mn=1*AMU;
m1p = 1*AMU;
delta = 0.2;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Initial Value to start root finding [choose as 0.1, 0.3, 0.5]
%iniValue = [0.01, 0.05, 0.1, 0.2, 0.25, 0.3, 0.4, 0.5, 0.6]; 
iniValue = 0.5;
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% create empty list to hold the data values 
xdata = zeros(); 
ydata = zeros();
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
i = 1; % index of 'xdata' and 'ydata'
% Loop over alpha0
while (alpha0 <= 100)
    % Use the initial values as 0.1, 0.3 and 0.5 respectively for
    % multivaled solutions
    for j = 1:length(iniValue)
        options = optimset('TolX',1E-3,'algorithm','bisection');
        psis = fzero(@(psis)sub(psis),iniValue(j));
        xdata(i) = alpha0;
        ydata(i) = psis;
        i = i+1;   
    end
    alpha0 = alpha0 + 0.1;         
end    
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Omit the values of ydata which are zero
for k = 1:length(ydata)
    if(ydata(k) <0.0001) % Put the roots greater than 0.6 to NaN ( add '|| ydata(k)>0.6')
        ydata(k) = NaN;
    end
end
%+++++++++++++++++++++++++++++ Plot graph ++++++++++++++++++++++++++++++++
% 
figure(1)
plot(xdata,ydata,'o','Markersize',5,'MarkerfaceColor','g','MarkerEdgeColor','black'), grid on, hold on
%plot(xdata,ydata,'o','Markersize',2,'MarkerfaceColor','r','MarkerEdgeColor','None'), grid on, hold on
%x1=[1.75, 1.75]; x2=[16.08, 16.08];
%y1=[0.0, 0.8]; y2=[0.0, 0.8];
%line(x1,y1,'Color','red','LineStyle','--')
%line(x2,y2,'Color','red','LineStyle','--')
xlabel('\alpha_{0}'), ylabel('\Psi_{s}')
%axis([min(xdata) 100 0.0 0.8])

% +++++++++++++++++++++ Save MAT File +++++++++++++++++++++++++++++++++++
% filename = ['./psis_gamma_var/psis_gamma_',num2str(gamma,'%d'),'.mat'];
% filename = ['psis','.mat'];
% save(filename)  




