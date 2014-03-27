function [ Frr ] = F_net( omega_motor,terrain_angle,rover,planet,Crr )
%
%F_net.m
%written by the members of MEEN 357 501 Group 16
%
%General Description
%Computes the total force acting on the rover in the direction of its
%motion
%
%Calling Syntax
%  Frr = F_net(omega_motor,terrain_angle,rover,planet,Crr)
%
%Input Arguments
% omega_motor | array  |Array of motor shaft speeds
%terrain_angle| array  |Array of terrain angles
%    rover    | struct |Data structure containing rover definition
%    planet   | struct |Data structure containing planet gravity parameter
%     Crr     | scalar |Value of rolling resistance coefficient
%
%Return Arguments
%    Frr      | array  |Array of forces
%
%Citation: MEEN 357 Design project Phase 1 - Appendix C: F_net.m
    if nargin ~= 5
        error('Check number of inputs');
    elseif isnumeric(omega_motor)~=1 ||isnumeric(terrain_angle) ~= 1 
        error('Omega_motor and/or terrain_angleis not a numeric array');
    elseif max(terrain_angle) >75 || min(terrain_angle)<-75
        error('Terrain_angle is not practicle');
    elseif isstruct(rover)~=1 || isstruct(planet)~=1
        error('Rover is not a structure array');
    elseif Crr<0
        error('Crr is negative');
    else
        Fd=F_drive(omega_motor,rover);
        Fg=F_gravity(terrain_angle,rover,planet);
        Fr=F_rolling(terrain_angle,rover,Crr,planet,omega_motor);
        %total force is sum of forces
        Frr=Fd+Fr+Fg;
    end

end
