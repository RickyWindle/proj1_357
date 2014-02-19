function [ Frr ] = F_net( omega_motor,terrain_angle,rover,planet,Crr )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

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
    Frr=(Fd+Fg+Fr)*6;

end

