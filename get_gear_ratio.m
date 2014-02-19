function [ Ng ] = get_gear_ratio( speed_reducer )
% get_gear_ratio.m computes the gear ratio of the speed reducer.

if nargin ~= 1
    error('Check number of inputs')
elseif isstruct(speed_reducer)~=1
    error('Speed reducer is not a structure array')
elseif strcmpi(speed_reducer.type,'reverted')~=1
    error('speed_reducer.type must be "reverted"')
else Ng=(speed_reducer.diam_gear/speed_reducer.diam_pinion)^2;
end

end

