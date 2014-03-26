
%subsub wheel
field1='radius';
value1=.2;
field2='mass';
value2=1;
wheel=struct(field1,value1,field2,value2);
%subsub speed reducer
field1='type';
value1='reverted';
field2='diam_pinion';
value2=.04;
field3='diam_gear';
value3=.06;
field4='mass';
value4=1.5;
speed_reducer=struct(field1,value1,field2,value2,field3,value3,field4,value4);
%subsub motor
field1='torque_stall';
value1=165;
field2='torque_noload';
value2=0;
field3='speed_noload';
value3=3.85;
field4='mass';
value4=5;
field5='effcy_tau';
value5=[0,10,20,40,75,165];
field6='effcy';
value6=[0,.6,.75,.73,.55,.05];
motor=struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6);
%sub wheel assembly
wheel_assembly=struct('wheel',wheel,'speed_reducer',speed_reducer,'motor',motor);
%sub chassis
field1='mass';
value1=674;
chassis=struct(field1,value1);
%sub science payload
field1='mass';
value1=80;
science_payload=struct(field1,value1);
%sub power subsys
field1='mass';
value1=100;
power_subsys=struct(field1,value1);
%sub telemetry
field1='Time';
value1=[];
field2='completion_time';
value2=[];
field3='velocity';
value3=[];
field4='position';
value4=[];
field5='distance_traveled';
value5=[];
field6='max_velocity';
value6=[];
field7='average_energy';
value7=[];
field8='power';
value8=[];
field9='battery_energy';
value9=[];
field10='energy_per_distance';
value10=[];
telemetry=struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,...
    field6,value6,field7,value7,field8,value8,field9,value9,field10,value10);
%struct rover
rover=struct('wheel_assembly',wheel_assembly,'chassis',chassis,'science_payload',science_payload,'power_subsys',power_subsys,'telemetry',telemetry);
%struct planet
planet=struct('g',-3.72);


