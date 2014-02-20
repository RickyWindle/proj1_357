struc;
Crr_list=linspace(0.01,0.4,25);
slope_list_deg=linspace(-10,35,25);   %in degrees

[CRR,SLOPE]=meshgrid(Crr_list,slope_list_deg);
VMAX=zeros(size(CRR));
omega_motor=zeros(size(CRR));
n=size(CRR,1);
for i=1:n
    for j=1:n
        Crr_sample=CRR(i,j);
        slope_sample=SLOPE(i,j);
        omega_motor(i,j)=fzero(@(x) F_net(x,slope_sample,rover,planet,Crr_sample),.2);
        VMAX(i,j)=wheel.radius/get_gear_ratio(speed_reducer)*omega_motor(i,j);
    end
end
surf(CRR,SLOPE,VMAX);


% i=max(size(slope_list_deg));
% terrain_angle=slope_list_deg;
% omega_motor=zeros(1,i);
% v_max=zeros(1,i);
% for m=1:i
%     for n=1:i
%     omega_motor(m,n)=fzero(@(x) F_net(x,terrain_angle(m,n),rover,planet,Crr_list(m,n)),0.2);
%     v_max(m,n)=wheel.radius/get_gear_ratio(speed_reducer)*omega_motor(m,n);
%     end
% end
% surf(Crr_list,slope_list_deg,v_max);
% % xlabel('Slope of Terrain (Degrees)');
% % ylabel('Maximum Velocity (m/s)');