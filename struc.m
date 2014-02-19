
%subsub wheel
field1='radius';
value1=.2;
field2='mass';
value2=1;
wheel=struct(field1,value1,field2,value2);
%subsub speed reducer
field1='type';
value1=[];
field2='diam_pinon';
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
motor=struct(field1,value1,field2,value2,field3,value3,field4,value4);
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
%struct rover
rover=struct('wheel_assembly',wheel_assembly,'chassis',chassis,'science_payload',science_payload,'power_subsys',power_subsys);



