DIMENSIONS = 3;

N_PARTICLES = 1500;
SIZE = 1;
SPAWN_VELO = 0;

location = zeros(N_PARTICLES, 3);
velocity = zeros(N_PARTICLES, 3);
mass = zeros(N_PARTICLES, 1);

for k = 1 : N_PARTICLES
  location(k, :) = (rand(1, 3) - .5) * SIZE;
  if DIMENSIONS == 2
    location(k, 3) = 0;
  end
  velocity(k, :) = (rand(1, 3) - .5) * SPAWN_VELO;
  velocity(k, 3) = 0;
  if mod(k, 2) == 0
    mass(k, :) = -1;
  else
    mass(k, :) = 1;
  end
end
