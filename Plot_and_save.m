load data_manual.mat

time  = tanks(1,:);
level2_sp = tanks(2,:);
gamma = tanks(3,:);
pump  = tanks(4,:);
level1 = tanks(5,:);
level2 = tanks(6,:);

figure(2)
hold off

subplot(4,1,1)
hold off
plot(time,gamma,'g:')
hold on
legend('Valve Position');
axis([min(time) max(time) 0 1]);

subplot(4,1,2)
hold off
plot(time,pump,'k.-')
hold on
legend('Pump Output')
axis([min(time) max(time) 0 1]);

subplot(4,1,3)
hold off
plot(time,level1,'m--')
hold on
legend('Level_1')
axis([min(time) max(time) 0 1]);

subplot(4,1,4)
hold off
plot(time,level2,'r--')
hold on
plot(time,level2_sp,'b-')
legend('Level_2','Level_2 Setpoint')
axis([min(time) max(time) 0 1]);

% save data to text file
data = tanks';
% enforce initial conditions so that FOPDT fitting shows the
%   initial change
data(1,3:6) = 0;

save -ascii 'data_manual.txt' data