function {matrices, p} = make_row(M_list, p, Rs, start)
	t = 1;
	R1 = [[-1, 0, 0]; [2*t, 1, 0]; [2/t, 0, 1]];
	R2 = [[1, 2/t, 0]; [0, -1, 0]; [0, 2*t, 1]];
	R3 = [[1, 0, 2*t]; [0, 1, 2/t]; [0, 0, -1]];


	if mod(p,2) == 0
		A = {R3, R2, R1};
	else
		A = {R1, R2, R3};
	endif

	matrices = cell(1, 2^(p+1));

	for i = [1:2^p]

	endfor

endfunction
