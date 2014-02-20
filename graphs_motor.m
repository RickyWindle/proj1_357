%Motor shaft speed
omega_noload=rover.wheel_assembly.motor.speed_noload;
omega=linspace(0:3.85);

%define tau_s
tau_s=rover.wheel_assembly.motor.torque_stall;
%define tau_noload
tau_noload=rover.wheel_assembly.motor.torque_noload;

for i=1:100;
    tau=tau_s-((tau_s-tau_nl)/omega_noload)*omega(i);
end
 power=tau*omega;

%Need omega vs. tau
figure;
subplot(3,1,1);
plot(tau,omega);
xlabel('Motor Shaft Torque (Nm)');
ylabel('Motor Shaft Speed (rad/s');

subplot(3,1,2);
plot(tau,power);
xlabel('Motor Shaft Torque (Nm)');
ylabel('Motor Power (W)');

subplot(3,1,3);
plot(omega,power);
xlabel('Motor Shaft Speed (rad/s)');
ylabel('Motor Power (W)');
