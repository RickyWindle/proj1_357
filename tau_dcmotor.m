function [ tau ] = tau_dcmotor( omega, motor )
%tau_dcmotor.m returns the motor shaft torque in Nm
%given the shaft speed in rad/s and the motor specifications 
% omegacheck=isnumeric(omega)
% omegasize=length(omega)
if nargin(tau_dcmotor) ~= 2
    error('Check number of inputs')
elseif isnumeric(omega) ~= 1
    error('Omega is not a numeric array')
elseif isstruct(motor)~=1
    error('Motor is not a structure array')
end
if omega>motor.speed_noload
    tau=0;
elseif omega < 0
    tau = motor.torque_stall;
end
tau=motor.torque_stall-(motor.torque_stall-motor.torque_noload)*...
    omega/motor.speed_noload;
end

