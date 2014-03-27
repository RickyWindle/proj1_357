function [rover]=simulate_rover(rover,planet,experiment,end_event)
%
%simulate_rover.m
%written by the members of MEEN 357 501 Group 16
%
%General Description
%This function integrates the trajectory of a rover.
%
%Calling Syntax
%  rover=simulate_rover(rover,planet,experiment,end_event)
%
%Input Arguments
%  rover   |     struct    |Data structure containing rover definition
%  planet  |     struct    |Data structure containing planet definition
%experiment|     struct    |Data structure containing experiment definition
%end_event |     struct    |Data structure containing the conditions
%                           necessary and sufficient to terminate
%                           simulation of rover dynamics
%
%Return Arguments
%  rover   |     struct    |Data structure containing rover definition,
%                           including updated telemetry information
%                           
%Citation: MEEN 357 Design project Phase 2 - Appendix: simulate_rover.m

    options=odeset('Events',@(t,y)end_of_mission_event(t,y,end_event));
    %use ode45 to solve for time, velocity, and position.
    [T,Y]=ode45(@(t,y) rover_dynamics(t,y,rover,planet,experiment),experiment.time_range,experiment.initial_conditions,options);
    %Y(:,1) is velocity Y(:,2) is position
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
    %energy per distance is energy divided by total distance
    rover.telemetry.energy_per_distance=E/max(Y(:,2));
end