to_break = 0;
for k = 1 : N_PARTICLES
  for kk = 1 : N_PARTICLES
    if k == kk
      continue;
    end
    relevance = norm(location(k, :) - location(kk, :)) / norm(location(k, :) + location(kk, :)) ^ 2;
    if relevance < MERGE_THRESHOLD
      disp("merge");
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
        to_break = 1;
        break;  
      end
      location(k, :) = (mass(k) * location(k, :) + mass(kk) * location(kk, :)) / combined_mass;
      velocity(k, :) = (mass(k) * velocity(k, :) + mass(kk) * velocity(kk, :)) / combined_mass;
      mass(k) = combined_mass;
      id_to_remove = kk;
      removeParticle();
      to_break = 1;
      break;  
    end
  end
  if to_break
    break;
  end
end
updateMassCache();
