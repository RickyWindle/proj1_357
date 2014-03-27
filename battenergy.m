function [ E ] = battenergy( t,v,rover )
%
%battenergy.m
%written by the members of MEEN 357 501 Group 16
%
%General Description
%This function finds the total electrical energy consumed from the rover
%battery pack over a simulation profile, defined as time-velocity paris.
%This function assumes all 6 motors are driven from the same battery pack.
%
%Accounts for the inefficiencies of transforming electrical energy to 
%mechanical energy using a DC motor.
%
%Calling Syntax
%  E = battenergy(t,v,rover)
%
%Input Arguments
%  t  |N-element array|Array of time samples from a rover simulation 
%  v  |N-element array|Array of rover velocity data from a simulation
%rover|     struct    |Data structure containing rover definition
%
%Return Arguments
%  E  |     scalar    |Total electrical energy consumed from the rover
%                      battery pack over the input simulation profile
%
%Citation: MEEN 357 Design project Phase 2 - Appendix: battenergy.m

%Concept: integral(Power)dt from t0 to tf
%remember to multiply by 6 to find total energy

%find the size of time array
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
    else

        tau_data=rover.wheel_assembly.motor.effcy_tau;
        eff_data=rover.wheel_assembly.motor.effcy;

        P=mechpower(v,rover);
        w=motorW(v,rover);
        tau=tau_dcmotor(w,rover);
        i=max(size(tau));
        eff=zeros(i,1);
        P_new=zeros(i,1);
        for j=1:i
            %find the efficiency at specified tau
            eff(j)=interp1(tau_data,eff_data,tau(j),'spline');
            %new power is based offset by rover's efficiency
            P_new(j)=P(j)/eff(j);
        end

        %use trapizoid rule to find the intergral of power which is energy.
        h=(t(n)-t(1))/(n-1);
        Atrap=zeros(n-1,1);
        for i=1:n-1
            Atrap(i)=(P_new(i)+P_new(i+1))/2*h;
        end

        %total used energy is the sum multi by 6 wheels
        E=6*sum(Atrap);
    end

end

