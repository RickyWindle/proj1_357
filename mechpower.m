function [ P ] = mechpower( v,rover )
%this function file computes the instantaneous mechanical power output by a
%single DC motor
if nargin~=2
    error('Check number of inputs');
elseif isnumeric(v)~=1
    error('v is not a numeric array');
elseif isstruct(rover)~=1
    error('rover is not a struct');
end
i=max(size(v));
w=zeros(i,1);
P=zeros(i,1);

for n=1:i
    w(n)=motorW(v(n),rover);
    P(n)=tau_dcmotor(w(n),rover)*w(n);
end

end