mass_product = zeros(N_PARTICLES, N_PARTICLES);
for k = 1 : N_PARTICLES
  mass_product(k, :) = mass * mass(k);
end
positives = mass > 0;
negatives = mass < 0;
