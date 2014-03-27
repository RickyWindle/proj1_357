function [ dydt ] = rover_dynamics( t,y,rover,planet,experiment )
%
%rover_dynamics.m
%written by the members of MEEN 357 501 Group 16
%
%General Description
%Computes the derivative of the state vector for the rover given its
%current state. It is intended to be passed to a ode solver.
%
%Calling Syntax
%  dydt = rover_dynamics(t,y,rover,planet,experiment)
%
%Input Arguments
%    t     |     scalar    |Time sample 
%    y     |   2x1 array   |Array of dependent variables. First element is 
%                           rover velocity, and second its position.
%  rover   |     struct    |Data structure containing rover definition
%  planet  |     struct    |Data structure containing planet definition
%experiment|     struct    |Data structure containing experiment definition
%
%Return Arguments
%   dydt   |   2x1 array   |First derivatives of state vector. First
%                           element is rover acceleration, second is
%                           velocity
%
%Citation: MEEN 357 Design project Phase 2 - Appendix: rover_dynamics.m

    dydt=zeros(2,1);
    terrain_angle=interp1(experiment.alpha_dist,experiment.alpha_deg,y(2),'spline');
    m=get_mass(rover);
    w=motorW(y(1),rover);
    f=F_net(w,terrain_angle,rover,planet,experiment.crr);
    %acceleration is found reworking f=ma to solve for a
    dydt(1)=(1/m)*f;
    %velocity is found by finding the antiderivative of acceleration which
    %is acceleration * time + initial velocity
    dydt(2)=dydt(1)*t+experiment.initial_conditions(1);

end

