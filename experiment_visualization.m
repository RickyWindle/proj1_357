load experiment1.mat;

location=linspace(experiment.alpha_dist(1),experiment.alpha_dist(end),100);
terrain_angle=interp1(experiment.alpha_dist,experiment.alpha_deg,location,'spline');

plot(location,terrain_angle,experiment.alpha_dist,experiment.alpha_deg,'*');
title('Position vs. Terrain Angle');
xlabel('Position (m)');
ylabel('Terrain Angle (deg)');