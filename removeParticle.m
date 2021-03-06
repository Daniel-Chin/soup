mass(id_to_remove) = mass(N_PARTICLES);
location(id_to_remove, :) = location(N_PARTICLES, :);
velocity(id_to_remove, :) = velocity(N_PARTICLES, :);
N_PARTICLES = N_PARTICLES - 1;
mass = mass(1:N_PARTICLES);
location = location(1:N_PARTICLES, :);
velocity = velocity(1:N_PARTICLES, :);
