close all; 

T_MAX = 1.5;

for DIMENSIONS = [2, 3]
  for N = [3 4 5 6 7 8 9 10 11 12 13 14 17 23 27 33 69]
    spawn_matrix();

    univPars();
    initSim();
    setRender();
    OUTPUT_DIR = sprintf('D:/soup/output_%dD%d_dyna/', DIMENSIONS, N);
    mkdir(OUTPUT_DIR);
    OUTPUT_PATH = OUTPUT_DIR + "%d.png";

    render();
    while t < T_MAX
      step();
      render();
      if render_elapsed > SPF || save_oversample
        render_elapsed = 0;
        saveRender();
      end
      render_elapsed = render_elapsed + dt;
      t = t + dt;
    end
  end
end
