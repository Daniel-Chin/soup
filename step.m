min_distance_3 = inf;

force_G = zeros(N_PARTICLES, 3);
for k = 1 : N_PARTICLES
  displace = location - location(k, :);
  distance_3 = sum(displace .^ 2, 2) .^ 1.5;
  distance_3(k) = inf;  % any non-zero
  min_distance_3 = min(min_distance_3, min(distance_3));
  force_G(k, :) = sum(mass_product(:, k) .* displace ./ distance_3, 1);
end
force = force_G * G;

velocity = velocity + (force ./ mass) * dt;
location = location + velocity * dt;

dt_multiplier = min_distance_3 ^ .5 * 30;

if mod(step_i , 16) == 0
  checkMerge();
end

step_i = step_i + 1;
