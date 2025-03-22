function tally_result = count_tally(file_list)

	num_files = rows(file_list);
	row_tallys = cell(1,num_files);

	for i = [1:num_files]
		lengths = group_buckets(read_lengths(file_list{i}));
		row_tallys{i} = lengths;
	endfor

	tally_result = combine_cells(row_tallys);

endfunction
