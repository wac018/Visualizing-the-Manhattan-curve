function A = path_to_mat(adj_matrix, P, t) %, reflections)

R1 = [[-1, 0, 0]; [2*t, 1, 0]; [2/t, 0, 1]];
R2 = [[1, 2/t, 0]; [0, -1, 0]; [0, 2*t, 1]];
R3 = [[1, 0, 2*t]; [0, 1, 2/t]; [0, 0, -1]];

A = eye(3);

for i = [1:columns(P) - 1]
	switch(adj_matrix(P(i), P(i+1)))
		case 1
			A = A*R1;
		case 2
			A = A*R2;
		case(3)
			A = A*R3;
	endswitch
endfor

endfunction
