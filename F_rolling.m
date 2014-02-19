function [ Frr ] = F_rolling( terrain_angle, rover, Crr, planet, omega_motor )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if nargin ~= 5
    error('Check number of inputs');
elseif isnumeric(omega_motor)~=1 || isnumeric(terrain_angle) ~= 1
    error('Omega_motor and/or terrain_angle is not a numeric array');
elseif isstruct(rover)~=1
    error('Rover is not a structure array')
elseif max(terrain_angle) >75 || min(terrain_angle) <-75
    error('Terrain angle is not practicle');
elseif Crr<0
    error('Crr is negative');
else
    i=max(size(omega_motor));
    omega_out=zeros(1,i);
    vr=zeros(1,i);
    F=zeros(1,i);
    for n=1:i
        omega_out(n)=omega_motor(n)/get_gear_ratio(rover.wheel_assembly.speed_reducer);
        vr(n)=omega_out(n)*rover.wheel_assembly.wheel.radius;
        F(n)=erf(40*vr(n))*Crr*get_mass(rover)*planet.g*cosd(terrain_angle(n));
    end
    Frr=sum(F);
end

end

