function [ P ] = mechpower( v,rover )
%this function file computes the instantaneous mechanical power output by a
%single DC motor
if nargin~=2
    error('Check number of inputs');
elseif isnumeric(v)~=1
    error('v is not a numeric array');
elseif isstruct(rover)~=1
    error('rover is not a struct');
end
w=motorW(v,rover);
P=tau_dcmotor(w,motor)*w;
end