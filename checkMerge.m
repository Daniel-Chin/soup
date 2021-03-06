to_break = 0;
for k = 1 : N_PARTICLES
  relevance = vecnorm((location(k, :) - location)') ./ max(1, vecnorm((location(k, :) + location)') .^ 1);
  for kk = find(relevance < MERGE_THRESHOLD)
    if k == kk
      continue;
    end
    % disp("merge");
    disp(N_PARTICLES);
    combined_mass = mass(k) + mass(kk);
    if combined_mass == 0
      if kk > k
        id_to_remove = kk;
        removeParticle();
        id_to_remove = k;
        removeParticle();
      else
        id_to_remove = k;
        removeParticle();
        id_to_remove = kk;
        removeParticle();
      end
    else
      location(k, :) = (mass(k) * location(k, :) + mass(kk) * location(kk, :)) / combined_mass;
      velocity(k, :) = (mass(k) * velocity(k, :) + mass(kk) * velocity(kk, :)) / combined_mass;
      mass(k) = combined_mass;
      id_to_remove = kk;
      removeParticle();
    end
    to_break = 1;
    break;  
  end
  if to_break
    break;
  end
end
updateMassCache();
