function animate2d(pos, Hz, step, interval)
% 'pos' is a position matrix, in which columns are x and y position of n
% agents (x1, y1, x2, y2, ..., xn, yn), rows are time steps.
% 'Hz' is the sampling rate of the data. 
% 'step' is the number of data step in one frame in animation.
% 'interval' is the pause (seconds) after each frame in animation.
% The function generates an animation of the trajectories.
% by Jiuyang Bai 9/23/2018
% baijiuyang@hotmail.com

n = size(pos, 2)/2; % number of agents
f = size(pos, 1); % number of frames
% trajs = gobjects(n, 1);

x = pos(:, 1:2:end-1);
y = pos(:, 2:2:end);
figure;
hold on;
% print all trajectories
plot(x, y);

% use separate loop to print dots ON TOP OF all trajectories
p = scatter(x(1, :), y(1, :), 'bo', 'filled');

labels = string(1:n);
txt = text(x(1, :), y(1, :), labels);

hold off;
% decorate plots
title(['Animation of ' num2str(n) ' agents']);
xlabel('X');
ylabel('Y');
posRange = max(max(pos)) - min(min(pos));
margin = 0.1 * posRange;
xMid = mean(mean(x));
yMid = mean(mean(y));

axis([xMid - posRange/2 - margin, xMid + posRange/2 + margin, ...
    yMid - posRange/2 - margin, yMid + posRange/2 + margin]);
daspect([1 1 1]);

% update agent locations
for i = 2:step:f
    title([num2str(i/Hz) ' second(s)']);
    p.XData = x(i, :);
    p.YData = y(i, :);
    drawnow;
    delete(txt);
    txt = text(x(i, :), y(i, :), labels);
    pause(interval); % control the speed of animation by adding pause
end

end