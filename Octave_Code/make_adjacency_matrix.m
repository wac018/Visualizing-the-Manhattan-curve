function adj_matrix = make_adjacency_matrix(N)

adj_matrix = [0];

if N <= 1
	return;
endif

% Creates a vector with the total number of nodes after generating a tree with depth N
N_k = [[1], zeros(1, N-1)];
for k = [2:N]
	N_k(k) = N_k(k-1) + 2^(k - 1);
endfor

% Makes a blank adjacency matrix and then connects the nodes with 1's
adj_matrix = zeros(N_k(end));

col = 2;
for row = [1:N_k(end-1)]
	adj_matrix(row, col) = 1;
	adj_matrix(row, col+1) = 1;
	col = col + 2;
endfor

adj_matrix = encode_reflections(adj_matrix, N_k, 1);
adj_matrix = adj_matrix + adj_matrix';

endfunction

function adj_matrix = encode_reflections(A, N_k, starting_reflection)
	patterns = cell(3, 2);
	patterns(1,:) = {[3, 2, 1], [1, 2, 3]};

	for i = [1:N_k(end - 1)]
		col_count = 0;
		for j = [1:columns(A)]
			if col_count >= 2
				break;
			endif
			if A(i,j) == 1
				switch(mod(j, 6))
					case {0, 2}
						A(i,j) = 3;
					case {3, 5}
						A(i,j) = 2;
					case {1, 4}
						A(i,j) = 1;
				endswitch
				col_count = col_count + 1;
			endif
		endfor

	endfor

	adj_matrix = A;
endfunction
