function list = get_file_list(t)
<<<<<<< HEAD
	#addpath(["./lengths_t_",num2str(t)]);
	list = glob(["lengths_row_t_*.csv"]);
	#list = glob(["lengths_t_",num2str(t),"/lengths_row_t_*.csv"]);
=======
	addpath(["./lengths_t_",num2str(t)]);
	list = glob(["lengths_t_",num2str(t),"/lengths_row_t_*.csv"]);
>>>>>>> dcbfc020e8bdd06bcbada47b4af2943401321162
endfunction
