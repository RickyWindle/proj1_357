function [ w ] = motorW( v,rover )
%UNTITLED2 
%
%   Detailed explanation goes here

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
        w_out(n)=v(n)/rover.wheel_assembly.wheel.radius;
        w(n)=w_out(n)*Ng;
    end
end

end

