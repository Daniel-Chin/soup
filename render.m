hold off;
plot(0);
hold on;


scatter(location(positives, 1), location(positives, 2), sqrt(mass(positives)) * 300, 'b.');
scatter(location(negatives, 1), location(negatives, 2), sqrt(-mass(negatives)) * 300, 'r.');

rectangle('Position', [-RENDER_REF_RADIUS, -RENDER_REF_RADIUS, RENDER_REF_LEN, RENDER_REF_LEN]);

x_min = min(location(:, 1));
x_max = max(location(:, 1));
y_min = min(location(:, 2));
y_max = max(location(:, 2));
x_mid = (x_min + x_max) * .5;
y_mid = (y_min + y_max) * .5;
render_radius = max(x_max - x_min, y_max - y_min) * .55;
render_radius = max(RENDER_REF_RADIUS, render_radius);
axis([x_mid - render_radius, x_mid + render_radius, ...
      y_mid - render_radius, y_mid + render_radius]);
grid on;

title(sprintf("t = %f", t));

drawnow();
