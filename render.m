hold off;
% plot(0);
% hold on;

scatter3(location(positives, 1), location(positives, 2), location(positives, 3), (mass(positives)) .^ .33 * 300, 'b.');
hold on;
% scatter(location(positives, 1), location(positives, 2), sqrt(mass(positives)) * 300, 'b.');
scatter(location(negatives, 1), location(negatives, 2), sqrt(-mass(negatives)) * 300, 'r.');

rectangle('Position', [-RENDER_REF_RADIUS, -RENDER_REF_RADIUS, RENDER_REF_LEN, RENDER_REF_LEN]);

x_min = min(location(:, 1));
x_max = max(location(:, 1));
y_min = min(location(:, 2));
y_max = max(location(:, 2));
z_min = min(location(:, 3));
z_max = max(location(:, 3));
x_mid = (x_min + x_max) * .5;
y_mid = (y_min + y_max) * .5;
z_mid = (z_min + z_max) * .5;
render_radius = max([x_max - x_min, y_max - y_min, z_max - z_min]) * .55;
render_radius = max(RENDER_REF_RADIUS, render_radius);
axis([x_mid - render_radius, x_mid + render_radius, ...
      y_mid - render_radius, y_mid + render_radius, ...
      z_mid - render_radius, z_mid + render_radius]);
grid on;

title(sprintf("t = %f", t));

view(t * ROTATE_SPEED, 20);
drawnow();
