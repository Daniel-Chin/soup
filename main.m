close all; 

univPars();
initSim();
setRender();

render();
while 1
  step();
  render();
  if render_elapsed > SPF
    render_elapsed = 0;
    saveRender();
  end
  render_elapsed = render_elapsed + dt;
  t = t + dt;
end
