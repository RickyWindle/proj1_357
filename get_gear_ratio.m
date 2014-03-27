function [ Ng ] = get_gear_ratio( rover )
%
%get_gear_ration.m
%written by the members of MEEN 357 501 Group 16
%
%General Description
%Computes the gear ratio of the speed reducer
%
%Calling Syntax
%  Ng = get_gear_ratio(rover)
%
%Input Arguments
%    rover    | struct |Data structure containing rover definition
%
%Return Arguments
%    Ng       | scalar |Speed ratio from input pinion shaft to output gear
%                       shaft
%
%Citation: MEEN 357 Design project Phase 1 - Appendix C: get_gear_ratio.m

    if nargin ~= 1
        error('Check number of inputs');
    elseif isstruct(rover)~=1
        error('Input is not a structure array');
    elseif strcmpi(rover.wheel_assembly.speed_reducer.type,'reverted')~=1
        error('rover.wheel_assembly.speed_reducer.type must be "reverted"');
        %gear ratio found using speed rducer gear diameter divided by speed
        %reducer pinion diameter
    else Ng=(rover.wheel_assembly.speed_reducer.diam_gear/rover.wheel_assembly.speed_reducer.diam_pinion)^2;
    end

end

