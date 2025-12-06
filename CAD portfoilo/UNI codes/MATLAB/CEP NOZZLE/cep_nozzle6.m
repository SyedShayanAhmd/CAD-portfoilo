% constants
gamma = 1.4;
R = 287;

% input static pressures
P1 = 5.5e5; % upstream pressure (high pressure) in Pa
P2 = 0; % downstream pressure (low pressure) in Pa

% calculate Mach number (M)
M = sqrt((2*gamma*(P1/P2)^((gamma-1)/gamma)-(gamma-1))/gamma);

% calculate mass flow rate (m)
m = sqrt((2*gamma*M./(M-1)).*(P1/P2).*(R.^(2./gamma)).*(1-R.^((gamma-1)./gamma)));

% print the result
disp(['Mass Flow Rate: ', num2str(m)]);

% define range of pressure ratio (r)
r = linspace(0, 5.5, 1000);

% calculate pressure ratio for the converging-diverging nozzle
P2_converging_diverging = P1 ./ r;

% calculate mass flow rate for the converging-diverging nozzle
m_converging_diverging = sqrt((2*gamma*M./(M-1)).*(P1./P2_converging_diverging).*(R.^(2./gamma)).*(1-R.^((gamma-1)./gamma)));

% plot the mass flow rate vs pressure ratio
figure;
plot(r, m_converging_diverging);
xlabel('Pressure Ratio (r)');
ylabel('Mass Flow Rate (m)');
title('Mass Flow Rate vs Pressure Ratio');