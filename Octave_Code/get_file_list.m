function list = get_file_list(t)
	addpath(["./lengths_t_",num2str(t)]);
	list = glob(["lengths_t_",num2str(t),"/lengths_row_t_*.csv"]);
endfunction
