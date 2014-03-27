function [ tau ] = tau_dcmotor( omega, rover )
%
%tau_dcmotor.m
%written by the members of MEEN 357 501 Group 16
%
%General Description
%Returns the motor shaft torque, given the shaft speed and teh motor
%specifications structure.
%
%Calling Syntax
%  tau = tau_dcmotor(omega,rover)
%
%Input Arguments
%    omega    | array  |Motor shaft speed
%    rover    | struct |Data structure containing rover definition
%
%Return Arguments
%     ta      | array  |Torque at motor shaft
%
%Citation: MEEN 357 Design project Phase 1 - Appendix C: tau_dcmotor.m
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
                %torque is found using stall torque value, no load torque
                %value, motor shaft speed, and no load speed
                tau(n)=rover.wheel_assembly.motor.torque_stall-(rover.wheel_assembly.motor.torque_stall-rover.wheel_assembly.motor.torque_noload)*...
                omega(n)/rover.wheel_assembly.motor.speed_noload;
            end
        end
    end
end

