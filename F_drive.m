function [ Fd ] = F_drive( omega_motor,rover )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
if nargin ~= 2
    error('Check number of inputs')
elseif isnumeric(omega_motor) ~= 1
    error('Omega_motor is not a numeric array')
elseif isstruct(rover)~=1
    error('Rover is not a structure array')
else
    tau_in=tau_dcmotor(omega_motor,rover.wheel_assembly.motor);
    Ng=get_gear_ratio(rover.wheel_assembly.speed_reducer);
    i=max(size(tau_in));
    tau_out=zeros(1,i);
    F=zeros(1,i);
    for n=1:i
        tau_out(n)=tau_in(n)*Ng;
        F(n)=tau_out(n)/rover.wheel_assembly.wheel.radius;
    end
    Fd=sum(F);
end
end

