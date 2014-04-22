function [M,MEF_numb] = v2M_Mars(v,a)
% v2M_Mars
% 
% Converts descent speed, v [m/s], to Mach number on Mars as a function of
% altitude, a [m].
%
% Based on data obtained at http://www.aerospaceweb.org/question/atmosphere/q0249.shtml
%
% Returns only the absolute value Mach number (i.e., uses model 
% M = abs(v)/v_sound).
%

% this table defines the speed of sound vs. altitude on Mars
SPD_DATA = [
    0       244.4
    1000    243.7
    2000    243.2
    3000    242.7
    4000    242.2
    5000    241.7
    6000    241.2
    7000    240.7
    8000    239.6
    9000    238.4
    10000   237.3
    11000   236.1
    12000   235.0
    13000   233.8
    14000   232.6
    ];
%this table defines the MEF vs mach number
MEF=[
    .25     1
    .5      1
    .65     1
    .7      .98
    .8      .9
    .9      .72
    .95     .66
    1       .76
    1.1     .9
    1.2     .96
    1.3     .99
    1.4     .999
    1.5     .992
    1.6     .98
    1.8     .9
    1.9     .85
    2       .82
    2.2     .75
    2.5     .65
    2.6     .62
    ];

v_sound = interp1(SPD_DATA(:,1),SPD_DATA(:,2),a,'pchip');

M = abs(v)/v_sound;

MEF_numb=interp1(MEF(:,1),MEF(:,2),M,'pchip');