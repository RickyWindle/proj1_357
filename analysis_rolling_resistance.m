struc;
Crr_list=linspace(0.01,0.4,25);
i=max(size(Crr_list));
terrain_angle=0;
omega_motor=zeros(1,i);
v_max=zeros(1,i);
for n=1:i
    omega_motor(n)=fzero(@(x) F_net(x,terrain_angle,rover,planet,Crr_list(n)),[0 3.85]);
    v_max(n)=wheel.radius/get_gear_ratio(speed_reducer)*omega_motor(n);
end
plot(Crr_list,v_max);
xlabel('Coefficient of Rolling Resistance');
ylabel('Maximum Velocity (m/s)');