close all; 

univPars();
initSim();
setRender();

render();
while 1
  dt = DT * dt_multiplier;
  step();
  if render_elapsed > SPF
    render_elapsed = 0;
    render();
  end
  render_elapsed = render_elapsed + dt;
  t = t + dt;
end
