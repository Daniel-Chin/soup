DIMENSIONS = 2;

N = 7;
SIZE = 1;

N_PARTICLES = N ^ DIMENSIONS;

location = zeros(N_PARTICLES, 3);
velocity = zeros(N_PARTICLES, 3);
mass = zeros(N_PARTICLES, 1);

phase = -1;
for k = 1 : N_PARTICLES
  kk = k - 1;
  pos = mod(kk, N);
  location(k, 1) = SIZE * (pos / N - .5);
  kk = (kk - pos) / N;
  pos = mod(kk, N);
  location(k, 2) = SIZE * (pos / N - .5);
  pos = (kk - pos) / N;
  location(k, 3) = SIZE * (pos / N - .5);
  mass(k, :) = phase;
  phase = - phase;
end
