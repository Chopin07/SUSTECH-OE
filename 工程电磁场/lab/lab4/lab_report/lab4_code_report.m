clc;
clear;
close all;

% Experiment 4: magnetic focusing of charged particles
% Student: He Yanning
% Student ID: 12311512

% Basic parameters
m = 0.02;
q = 1.6e-2;
E = [0, 0, 0];
B = [0, 0, 8];
dt = 0.001;
t_ends = [1, 3, 8, 20, 100];
num_particles = 16;
output_dir = fullfile(pwd, 'figures');

if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

for case_idx = 1:numel(t_ends)
    t_end = t_ends(case_idx);
    t = 0:dt:t_end;

    fig = figure('Color', 'w', 'Position', [100, 100, 1400, 420]);
    tl = tiledlayout(fig, 1, 3, 'TileSpacing', 'compact', 'Padding', 'compact');
    title(tl, sprintf('Magnetic Focusing of Charged Particles (t = %g s)\nHe Yanning, 12311512', t_end), ...
        'FontSize', 14, 'FontWeight', 'bold');

    ax1 = nexttile;
    hold(ax1, 'on');
    grid(ax1, 'on');
    view(ax1, 3);
    xlabel(ax1, 'x (m)');
    ylabel(ax1, 'y (m)');
    zlabel(ax1, 'z (m)');
    title(ax1, '3D Trajectories');

    ax2 = nexttile;
    hold(ax2, 'on');
    grid(ax2, 'on');
    axis(ax2, 'equal');
    xlabel(ax2, 'x (m)');
    ylabel(ax2, 'y (m)');
    title(ax2, 'Top View (x-y)');

    ax3 = nexttile;
    hold(ax3, 'on');
    grid(ax3, 'on');
    xlabel(ax3, 'x (m)');
    ylabel(ax3, 'z (m)');
    title(ax3, 'Front View (x-z)');

    cmap = lines(num_particles);

    for k = 0:(num_particles - 1)
        v0 = [0.1 * sin(k * pi / 8), 0.1 * cos(k * pi / 8), 10];
        [r, v] = simulate_particle(m, q, E, B, dt, t, v0);

        plot3(ax1, r(:, 1), r(:, 2), r(:, 3), 'Color', cmap(k + 1, :), 'LineWidth', 1.1);
        plot(ax2, r(:, 1), r(:, 2), 'Color', cmap(k + 1, :), 'LineWidth', 1.1);
        plot(ax3, r(:, 1), r(:, 3), 'Color', cmap(k + 1, :), 'LineWidth', 1.1);

        if k == 0
            final_speed = norm(v(end, :));
            final_radius = hypot(r(end, 1), r(end, 2));
        end
    end

    annotation(fig, 'textbox', [0.34, 0.01, 0.32, 0.07], ...
        'String', sprintf('m = %.3f kg, q = %.4f C, |B| = %.1f T, dt = %.4f s, sample final speed = %.4f m/s, sample final radius = %.4f m', ...
        m, q, norm(B), dt, final_speed, final_radius), ...
        'HorizontalAlignment', 'center', 'EdgeColor', 'none', 'FontSize', 10);

    exportgraphics(fig, fullfile(output_dir, sprintf('magnetic_focusing_t%g.png', t_end)), 'Resolution', 220);
    close(fig);
end

fprintf('Finished generating figures in %s\n', output_dir);

function [r, v] = simulate_particle(m, q, E, B, dt, t, v0)
num_steps = numel(t);
r = zeros(num_steps, 3);
v = zeros(num_steps, 3);
v(1, :) = v0;

for i = 1:(num_steps - 1)
    force = q * E + q * cross(v(i, :), B);
    accel = force / m;
    v(i + 1, :) = v(i, :) + accel * dt;
    r(i + 1, :) = r(i, :) + v(i, :) * dt;
end
end
