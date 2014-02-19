function [ m ] = get_mass( rover )
%get_mass.m computes rover mass in kilograms.
%It accounts for the chassis, power subsystem, science payload, 
%and six wheel assemblies, which itself is comprised of a motor, 
%speed reducer, and the wheel itself.
if nargin ~= 1
    error('Check number of inputs');
elseif isstruct(rover)~=1
    error('Rover is not a structure array');
else
    m=6*rover.wheel_assembly.wheel.mass+...
        6*rover.wheel_assembly.motor.mass+rover.science_payload.mass...
        +rover.power_subsys.mass+rover.chassis.mass+...
        6*rover.wheel_assembly.speed_reducer.mass;
end

end

