%analysis_errain_slope.m finds the maximum rover speed for various terain slopes
struc;
Crr=0.1;
slope_list_deg=linspace(-10,35,25);   %in degrees
i=max(size(slope_list_deg));
terrain_angle=slope_list_deg;
omega_motor=zeros(1,i);    %preallocating memory
v_max=zeros(1,i);          %preallocating memory
for n=1:i
    try
    omega_motor(n)=fzero(@(x) F_net(x,terrain_angle(n),rover,planet,Crr),[0 3.85]);
    v_max(n)=wheel.radius/get_gear_ratio(speed_reducer)*omega_motor(n);
    catch
    end
end
plot(slope_list_deg,v_max);
xlabel('Slope of Terrain (Degrees)');
ylabel('Maximum Velocity (m/s)');