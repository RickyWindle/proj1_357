function [rover]=simulate_rover(rover,planet,experiment,end_event)

options=odeset('Events',@(t,y)end_of_mission_event(t,y,end_event));
[T,Y]=ode45(@(t,y) rover_dynamics(t,y,rover,planet,experiment),experiment.time_range,experiment.initial_conditions,options);
P=mechpower(Y(:,1),rover);
E=battenergy(T,Y(:,1),rover);

rover.telemetry.Time=T;
rover.telemetry.completion_time=max(T);
rover.telemetry.velocity=Y(:,1);
rover.telemetry.position=Y(:,2);
rover.telemetry.distance_traveled=max(Y(:,2));
rover.telemetry.max_velocity=max(Y(:,1));
rover.telemetry.average_velocity=mean(Y(:,1));
rover.telemetry.power=P;
rover.telemetry.battery_energy=E;
rover.telemetry.energy_per_distance=E/max(Y(:,2));
end