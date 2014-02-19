function [ Frr ] = F_rolling( terrain_angle, rover, Crr, planet, omega_motor )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if nargin ~= 2
    error('Check number of inputs')
elseif isnumeric(omega_motor) || isnumeric(terrain_angle) ~= 1
    error('Omega_motor and/or terrain_angle is not a numeric array')
elseif isstruct(rover)~=1
    error('Rover is not a structure array')
elseif terrain_angle <75 || terrain_angle <-75
    error('Terrain angle is not practicle');
elseif Crr<0
    error('Crr is negative');
else
    
    Frr=erf(40*vr)*Crr*get_mass(rover)*planet.g*cosd(terrain_angle)
 
end

