function [ Fgt ] = F_gravity( terrain_angle,rover,planet )
%F_gravity.m computes the component of force due to gravity, in 
%Newtons, acting in the direction of rover translation.
if nargin ~= 3
    error('Check number of inputs');
elseif isnumeric(terrain_angle)~=1
    error('Speed reducer is not a numeric array');
elseif terrain_angle<-75 || terrain_angle>75
    error('Terrain_angle is not practical');
elseif isstruct(rover)~=1
    error('Rover is not a structure array');
elseif isstruct(planet)~=1
    error('Planet is not a structure array');
else Fgt=get_mass(rover)*planet.g*sind(terrain_angle);
end

end

