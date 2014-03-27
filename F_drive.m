function [ Fd ] = F_drive( omega_motor,rover )
%
%F_drive.m
%written by the members of MEEN 357 501 Group 16
%
%General Description
%Computes the combined drive force, in Newtons, acting on the rover due to
%all six wheels. 
%
%
%Calling Syntax
%  Fd = F_drive(omega_motor,rover)
%
%Input Arguments
%omega_motor| array  |Array of motor shaft speeds
%   rover   | struct |Data structure containing rover definition
%
%Return Arguments
%    Fd     | array  |Array of drive forces
%
%Citation: MEEN 357 Design project Phase 1 - Appendix C: F_drive.m
    if nargin ~= 2
        error('Check number of inputs');
    elseif isnumeric(omega_motor) ~= 1
        error('Omega_motor is not a numeric array');
    elseif isstruct(rover)~=1
        error('Rover is not a structure array');
    else
        tau_in=tau_dcmotor(omega_motor,rover);
        Ng=get_gear_ratio(rover);
        i=max(size(tau_in));
        tau_out=zeros(1,i);
        F=zeros(1,i);
        for n=1:i
            %torque out is torque in multi by gear ratio
            tau_out(n)=tau_in(n)*Ng;
            %compute drive force using torque out, wheel radius, and 6 wheels
            F(n)=6*tau_out(n)/rover.wheel_assembly.wheel.radius;  
        end
        Fd=F;
    end
end
