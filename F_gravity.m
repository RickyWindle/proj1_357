function [ Fgt ] = F_gravity( terrain_angle,rover,planet )
%
%F_gravity.m
%written by the members of MEEN 357 501 Group 16
%
%General Description
%Computes the component of force due to gravity acting in the direction of
%rover translation.
%
%Calling Syntax
%  Fgt = F_gravity(terrain_angle,rover,planet)
%
%Input Arguments
%terrain_angle| array  |Array of terrain angles
%    rover    | struct |Data structure containing rover definition
%    planet   | struct |Data structure containing planet gravity parameter
%
%Return Arguments
%    Fgt      | array  |Array of forces
%
%Citation: MEEN 357 Design project Phase 1 - Appendix C: F_gravity.m
    if nargin ~= 3
        error('Check number of inputs');
    elseif isnumeric(terrain_angle)~=1
        error('Speed reducer is not a numeric array');
    elseif min(terrain_angle)<-75 || max(terrain_angle)>75
        error('Terrain_angle is not practical');
    elseif isstruct(rover)~=1
        error('Rover is not a structure array');
    elseif isstruct(planet)~=1
        error('Planet is not a structure array');
    else
        i=max(size(terrain_angle));
        F=zeros(1,i);
        for n=1:i
            %compute gravitational force using mass of rover, planet's gravity,
            %and terrain agnel using degrees.
            F(n)=get_mass(rover)*planet.g*sind(terrain_angle(n));
        end
        Fgt=F;
    end

end
