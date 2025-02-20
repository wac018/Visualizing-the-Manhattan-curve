
N = 10;
t = 1;


disp("Generating adjacency matrix")
adj_matrix = make_adjacency_matrix(N);
disp("Generating adjacency matrix: finished");

% Possible future optimization: Calculate the length of each step in a path as
% the loop progresses so that  it doesn't have to recalculate the path for every node

ls = zeros(1, columns(adj_matrix));

% For right now, I am only looking at the branch where the starting reflection is R1


disp("Converting paths to matrices");
for i = [2:columns(adj_matrix)]
	% P is the path from node 1 to node i
	t0 = clock();
	disp("Start dijkstra search")
	P = dijkstra_alg(adj_matrix, 1, i);
	disp("End dijkstra search: ")
	disp(etime(clock(), t0));
	M = path_to_mat(adj_matrix, P, t);
	ls(i) = L_t(M);
endfor
disp("Converting paths to matrices: finished")

disp("Grouping lengths");
groups = group_buckets(ls);
disp("Grouping lengths: finshed")

xs = groups(1,:);
ys = groups(2,:);

bar(xs, ys);
