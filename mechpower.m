function [ P ] = mechpower( v,rover )
%
%mechpower.m
%written by the members of MEEN 357 501 Group 16
%
%General Description
%Computes teh instantaneous mechanical power output by a single DC motor at
%each point in a given velocity profile
%
%Calling Syntax
%  P = mechpower(v,rover)
%
%Input Arguments
%  v  |N-element array|Array of rover velocity data from a simulation
%rover|     struct    |Data structure containing rover definition
%
%Return Arguments
%  P  |N-element array|Array of instantaneous power output of a single 
%                      motor corresponding to each element in array v
%
%Citation: MEEN 357 Design project Phase 2 - Appendix: mechpower.m

    if nargin~=2
        error('Check number of inputs');
    elseif isnumeric(v)~=1
        error('v is not a numeric array');
    elseif isstruct(rover)~=1
        error('rover is not a struct');
    else
        i=max(size(v));
        w=zeros(i,1);
        P=zeros(i,1);

        for n=1:i
            w(n)=motorW(v(n),rover);
            %compute power using motor shaft speed and motor shaft tourqe
            P(n)=tau_dcmotor(w(n),rover)*w(n);
        end
    end

end