%efficiency_visualization.m plots motor torque vs. efficiency

struc;

tau_data=rover.wheel_assembly.motor.effcy_tau;
n=length(tau_data);

eff_data=rover.wheel_assembly.motor.effcy;
tau_motor=linspace(tau_data(1),tau_data(n),100);
%interp the data to visualize efficiency with corrisponding torque value
eff=interp1(tau_data,eff_data,tau_motor,'spline');

plot(tau_motor,eff,tau_data,eff_data,'*');
title('Motor Torque vs. Efficiency');
xlabel('Motor Torque (Nm)');
ylabel('Efficiency');