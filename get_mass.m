function [ m ] = get_mass( rover )
%
%get_mass.m
%written by the members of MEEN 357 501 Group 16
%
%General Description
%Computes rover mass, accounts for the chassis, power subsystem, science
%payload, and six wheel assemblies.
%
%Calling Syntax
%  m = get_mass(rover)
%
%Input Arguments
%    rover    | struct |Data structure containing rover definition
%
%Return Arguments
%      m      | scalar |Rover mass
%
%Citation: MEEN 357 Design project Phase 1 - Appendix C: get_mass.m
    if nargin ~= 1
        error('Check number of inputs');
    elseif isstruct(rover)~=1
        error('Rover is not a structure array');
    else
        %add all mass in structure
        m=6*rover.wheel_assembly.wheel.mass+...
            6*rover.wheel_assembly.motor.mass+rover.science_payload.mass...
            +rover.power_subsys.mass+rover.chassis.mass+...
            6*rover.wheel_assembly.speed_reducer.mass;
    end

end

