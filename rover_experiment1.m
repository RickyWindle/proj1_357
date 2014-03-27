
load experiment1.mat;
struc;
end_event;

end_event.max_distance=1000;
end_event.max_time=10000;
end_event.min_velocity=.01;

rover=simulate_rover(rover,planet,experiment,end_event);

figure;
subplot(3,1,1),
plot(rover.telemetry.Time,rover.telemetry.position),
title('Rover Position vs. Time'),
xlabel('Time (sec)'),
ylabel('Position (m)');
subplot(3,1,2),
plot(rover.telemetry.Time,rover.telemetry.velocity),
title('Rover Velocity vs. Time'),
xlabel('Time (sec)'),
ylabel('Velocity (m/s)');
subplot(3,1,3),
plot(rover.telemetry.Time,rover.telemetry.power),
title('Rover Power vs. Time'),
xlabel('Time (sec)'),
ylabel('Power (W)');
