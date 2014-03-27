function [ w ] = motorW( v,rover )
%
%motorW.m
%written by the members of MEEN 357 501 Group 16
%
%General Description
%Computes the rotational speed of the motor shaft given the translational
%velocity of the rover and the rover struct.
%
%Calling Syntax
%  w = motorW(v,rover)
%
%Input Arguments
%  v  |N-element array|Array of rover velocity data from a simulation
%rover|     struct    |Data structure containing rover definition
%
%Return Arguments
%  w  |     array     |Array of motor speeds [rad/s]
%
%Citation: MEEN 357 Design project Phase 2 - Appendix: motorW.m

    if nargin ~= 2
        error('Check number of inputs');
    elseif isstruct(rover)~=1
        error('Rover is not a structure array');
    elseif isvector(v)~=1
        error('Input velocity is not a vector');
    else Ng=get_gear_ratio(rover);
        x=max(size(v));
        w_out=zeros(x,1);
        w=zeros(x,1);
        for n=1:x
            %find wheel speed using velcity and wheel radius
            w_out(n)=v(n)/rover.wheel_assembly.wheel.radius;
            %motor shaft speed is found using wheel speed and gear ratio
            w(n)=w_out(n)*Ng;
        end
    end

end

