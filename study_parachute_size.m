%study_parachute_size.m
%
%Visualize simulation test runs of various parachute size
%size range from 14m to 19m every .5m
%outputs plot of diameter vs time
%diameter vs. speed
%diameter vs success rate

%load structure
define_edl_system;
define_planet;
define_mission_events;
%test variables
tmax=2000;
z=zeros(11,3);
dim=linspace(14,19,11);

for n=1:11
    %resets system data per run
    edl_system.altitude=11000;
    edl_system.velocity=-578;
    edl_system.rocket.on=false;
    edl_system.parachute.deployed=true;
    edl_system.parachute.ejected=false;
    edl_system.heat_shield.ejected=false;
    edl_system.sky_crane.on=false;
    edl_system.speed_control.on=false;
    edl_system.position_control.on=false;
    
    %changes diameter per run
    edl_system.parachute.diameter=dim(n);
    % the simulation. changing last argument to false turns off message echo
    [t,Y,edl_system] = simulate_edl(edl_system,mars,mission_events,tmax,true);
    %holds completion time
    z(n,1)=t(end);
    %holds rover speed=sky rane speed -.1m/s
    z(n,2)=edl_system.velocity-.1;
    %success conditions must be met rover velocity less than 1m/s sky crane
    %velocity greater than 4.5m/s
    if z(n,2)<=1 && Y(end,2)>=4.5
        z(n,3)=1;
    else
        z(n,3)=0;
    end
end

%plots
subplot(3,1,1);
plot(dim,z(:,1));
title('Parachute Diameter vs. Time');
xlabel('Parachute Diameter [m]');
ylabel('Time [s]');
grid on;
subplot(3,1,2);
plot(dim,z(:,2));
title('Parachute Diameter vs. Rover Speed');
xlabel('Parachute Diameter [m]');
ylabel('Rover Speed [m/s]');
grid on;
subplot(3,1,3);
plot(dim,z(:,3));
title('Parachute Diameter vs. Rover Landing Success');
xlabel('Parachute Diameter [m]');
ylabel('Landing Success[T=1, F=0]');
grid on;

