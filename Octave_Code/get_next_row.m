function output_cell = get_next_row(t, p, M)

<<<<<<< HEAD
	R1 = [[-1, 0, 0];
          [2*t, 1, 0];
          [2/t, 0, 1]];

	R2 = [[1, 2/t, 0];
          [0, -1, 0];
          [0, 2*t, 1]];

	R3 = [[1, 0, 2*t];
          [0, 1, 2/t];
          [0, 0, -1]];
=======
	R1 = [[-1, 0, 0]; [2*t, 1, 0]; [2/t, 0, 1]];
	R2 = [[1, 2/t, 0]; [0, -1, 0]; [0, 2*t, 1]];
	R3 = [[1, 0, 2*t]; [0, 1, 2/t]; [0, 0, -1]];
>>>>>>> dcbfc020e8bdd06bcbada47b4af2943401321162


	next_row = cell(1, 2*length(M));
	lengths = zeros(1, 2*length(M));

    if mod(p, 2) == 0
        A = {R3, R2, R1};
    else
        A = {R1, R2, R3};
    endif



    for i = [1:length(M)]
        next_row{2*i - 1} = A{mod(2*i - 1, 3) + 1}*M{i};
        next_row{2*i} = A{mod(2*i, 3) + 1}*M{i};
        lengths(2*i - 1) = L_t(next_row{2*i - 1});
        lengths(2*i) = L_t(next_row{2*i});
    endfor

    output_cell = {next_row, lengths};
endfunction
