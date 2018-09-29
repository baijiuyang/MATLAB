function newTraj = traj2d_tran(traj)
% This function takes a 2d trajectory and transform to its subjective
% coordinate system, so that the x asix is the unit vector of the vector
% that points from start to end point.
% by Jiuyang Bai 9/23/2018
% baijiuyang@hotmail.com

traj = traj - traj(1, :); % translate to origin
x = traj(end, :)/norm(traj(end, :)); % compute unit vector for x axis
y = null(x).'; % the y axis
newTraj = traj / [x; y];

end