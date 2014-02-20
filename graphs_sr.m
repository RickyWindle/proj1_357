struc;
x=linspace(0,rover.wheel_assembly.motor.speed_noload);
input1=tau_dcmotor(x,rover.wheel_assembly.motor);
output1=x/get_gear_ratio(rover.wheel_assembly.speed_reducer);
output2=get_gear_ratio(rover.wheel_assembly.speed_reducer)*input1;
output3=output1.*output2;

subplot(3,1,1), plot(output2,output1), xlabel('Motor shaft torque [Nm]'),...
    ylabel('Speed reducer speed [rad/s]');
subplot(3,1,2), plot(output2,output3), xlabel('Motor shaft torque [Nm]'),...
    ylabel('Speed reducer torque [Nm]');
subplot(3,1,3), plot(output1,output3), xlabel('Motor shaft speed [rad/s]'),...
    ylabel('Speed reducer power [W]');