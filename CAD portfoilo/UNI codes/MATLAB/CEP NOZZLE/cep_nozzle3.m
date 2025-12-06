% define pressure ratios
pressure_ratios = linspace(0,5.5,1000);

% define mass flow rate
mass_flow_rate = 0.5/97;

% calculate outlet pressure for each pressure ratio
outlet_pressure = pressure_ratios * 5.5;

% calculate mass flow rate at each pressure ratio
inlet_pressure = outlet_pressure ./ pressure_ratios;

% find sudden choke condition
sudden_choke_index = find(outlet_pressure > inlet_pressure,1);

% plot mass flow rate vs pressure ratio
figure;
plot(pressure_ratios,inlet_pressure);
hold on;
plot(pressure_ratios(sudden_choke_index),outlet_pressure(sudden_choke_index),'ro','MarkerSize',10,'MarkerFaceColor','r');
xlabel('Pressure Ratio');
ylabel('Mass Flow Rate');
title('Mass Flow Rate vs Pressure Ratio');
legend('Adiabatic Flow','Sudden Choke');