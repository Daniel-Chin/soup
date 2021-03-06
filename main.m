close all; 

univPars();
initSim();

while 1
  dt = DT * dt_multiplier;
  step();
  render();
  % pause(.01);
  t = t + dt;
end
