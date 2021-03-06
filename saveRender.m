if DO_SAVE
  saveas(gcf, sprintf(OUTPUT_PATH, save_render_i));
  save_render_i = save_render_i + 1;
end
