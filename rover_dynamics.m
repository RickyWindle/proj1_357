function [ dydt ] = rover_dynamics( t,y,rover,planet,experiment )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
dydt=zeros(2,1);
terrain_angle=interp1(experiment.alpha_dist,experiment.alpha_deg,y(2),'spline');
m=get_mass(rover);
w=motorW(y(1),rover);
f=F_net(w,terrain_angle,rover,planet,experiment.crr);
dydt(1)=(1/m)*f;
dydt(2)=dydt(1)*t+experiment.initial_conditions(1);

end

