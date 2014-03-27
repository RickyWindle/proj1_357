function [ tau ] = tau_dcmotor( omega, rover )
%tau_dcmotor.m returns the motor shaft torque in Nm
%given the shaft speed in rad/s and the motor specifications 
% omegacheck=isnumeric(omega)
% omegasize=length(omega)
if nargin ~= 2
    error('Check number of inputs');
elseif isnumeric(omega) ~= 1
    error('Omega is not a numeric array');
elseif isstruct(rover)~=1
    error('Motor is not a structure array');
else
    i=max(size(omega));
    tau=zeros(1,i);
    for n=1:i
        if omega(n)>rover.wheel_assembly.motor.speed_noload
            tau(n)=0;
        elseif omega(n) < 0
            tau(n) = rover.wheel_assembly.motor.torque_stall;
        else
            tau(n)=rover.wheel_assembly.motor.torque_stall-(rover.wheel_assembly.motor.torque_stall-rover.wheel_assembly.motor.torque_noload)*...
            omega(n)/rover.wheel_assembly.motor.speed_noload;
        end
    end
end
end

