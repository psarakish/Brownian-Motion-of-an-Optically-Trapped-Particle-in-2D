function [x,t,DR,DT] = homogeneous(N,dt,x0,R,T,eta,V,W)

kB = 1.38e-23;		% Boltzmann constant [J/K]
gamma = 6*pi*R*eta;	% friction coefficient [Ns/m]
DT = kB*T/gamma;		% translational diffusion coefficient [m^2/s]
DR = 6*DT/(8*R^2);	% rotational diffusion coefficient [rad^2/s]

x(1,:) = x0; 	% initial conditions (position)
theta = 0; 		% initial conditions (angle)

for n = 1:1:N

% Translational diffusion step
x(n+1,:) = x(n,:) + sqrt(2*DT*dt)*randn(1,2);

% Rotational diffusion step
theta = theta + sqrt(2*DR*dt)*randn(1,1);

% Torque step
theta = theta + dt*W;

% Drift step
x(n+1,:) = x(n+1,:) + dt*V*[cos(theta) sin(theta)];

% Plot
cla
hold on
plot(x(1:n+1,1)*1e6,x(1:n+1,2)*1e6,'k')
plot(x(n+1,1)*1e6,x(n+1,2)*1e6,'o', ...
'MarkerEdgeColor','k', ...
'MarkerFaceColor','g')
hold off
axis equal square
title(['velocity = ' num2str(V*1e6) ' \mum/s, ', ... 
'angular velocity = ' num2str(W) ' rad/s, ', ...
'time = ', num2str(dt*(n+1)) ' s'])
xlabel('x [\mum]')
ylabel('y [\mum]')
box on
axis equal
drawnow();

end

t = [0:dt:(N-1)*dt];