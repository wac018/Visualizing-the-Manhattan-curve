function adj_matrix = make_adjacency_matrix(N)

% This code makes the adjacency matrix that Giuseppe and I talked about on January 3, 2025

#{
We are generating an adjacency matrix for a tiling of triangles. Starting with a single
triangle, the next row down will have 3 triangles (two more than the previous line). The first row of triangles
(the row with the single triangle) will be labeled as row_1 and the second row as row_2, and so on.

For N numbers of rows, there will be N^2 total triangles in our tiling.

Each matrix can be split into four distinct parts
A | B
--|---
B'| C


#}

old_adj_matrix = [0];
%old_adj_matrix = [0 0 1 0; 0 0 1 0; 1 1 0 1; 0 0 1 0];

edge_weight = 1;


for i = [2:N]
	B = make_B(old_adj_matrix, i, edge_weight);
	C = make_C(old_adj_matrix, i, edge_weight);
	adj_matrix = [[old_adj_matrix B]; [B' C]];
	old_adj_matrix = adj_matrix;
endfor

endfunction


function B = make_B(M, N, weight)
	M_rows = rows(M);
	M_cols = columns(M);
	B_rows = M_rows;
	B_cols = N^2 - M_cols;

	B = zeros((N-1)^2, B_cols)

	alt_ones_and_zeros = [];
	for i = [1:B_cols - 2]
		entry = mod(i, 2);
		alt_ones_and_zeros = [alt_ones_and_zeros [entry]];
	endfor

	inner_sq_matrix = diag(alt_ones_and_zeros);
	padding_zeros = zeros(rows(inner_sq_matrix), 1);
	inner_sq_matrix = [padding_zeros inner_sq_matrix padding_zeros]

	B = [B; inner_sq_matrix];

endfunction


function C = make_C(M,N, weight)
	size_C = N^2 - rows(M);
	C = zeros(size_C, size_C);
	for j = [2:size_C]
		C(j-1,j) = weight;
	endfor
	C = C + C';
endfunction
