function [ Ng ] = get_gear_ratio( rover )
% get_gear_ratio.m computes the gear ratio of the speed reducer.

if nargin ~= 1
    error('Check number of inputs');
elseif isstruct(rover)~=1
    error('Input is not a structure array');
elseif strcmpi(rover.wheel_assembly.speed_reducer.type,'reverted')~=1
    error('rover.wheel_assembly.speed_reducer.type must be "reverted"');
else Ng=(rover.wheel_assembly.speed_reducer.diam_gear/rover.wheel_assembly.speed_reducer.diam_pinion)^2;
end

end

