t = 2;
N = 20;

R1 = [[-1, 0, 0]; [2*t, 1, 0]; [2/t, 0, 1]];

M = {R1};

ls = [L_t(M{1})];

for p = [0:N]
    row_length_cell = get_next_row(t, p, M);
    filename_row = ["row_t_", num2str(p),"_", num2str(p), ".txt"];
    filename_lengths = ["lengths_row_t_", num2str(t),"_", num2str(p), ".csv"];

    M = row_length_cell{1};
    new_ls = row_length_cell{2};

    save("-text", filename_row, "M");
    csvwrite(filename_lengths, new_ls);
    ls = [ls, new_ls];
    disp(["finished row: ", num2str(p)]);
endfor

