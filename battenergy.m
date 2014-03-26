function [ E ] = battenergy( t,v,rover )
%This function finds the total electrical energy consumed from the rover
%battery pack.

%Concept: integral(Power)dt from t0 to tf
%remember to multiply by 6 to find total energy

n=length(t);
if nargin~=3
    error('Check number of inputs');
elseif length(t)~=length(v)
    error('Length of t and v differ');
elseif isnumeric(t)~=1 || isnumeric(v)~=1
    error('t or v are not numeric');
elseif isstruct(rover)~=1
    error('Rover must be a struct');
elseif n<2
    error('Need at least 2 points to evaluate an integral');
end
P=mechpower(v,rover);
h=(t(n)-t(1))/(n-1);
Atrap=zeros(n-1);
for i=1:n-1
    Atrap(i)=(P(i)+P(i+1))/2*h;
end
Emech=6*sum(Atrap);
tau_data=rover.wheel_assembly.motor.effcy_tau;
eff_data=rover.wheel_assembly.motor.effcy;
eff=interpl(tau_data,eff_data,tau_dcmotor,'spline');
E=Emech/eff;
end

