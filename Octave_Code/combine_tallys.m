ns = [0:22];

groups = cell(1,columns(ns));

for i = ns
<<<<<<< HEAD
    lens = csvread(["lengths_row_t_1", num2str(i),".csv"]);
=======
    lens = csvread(["lengths_row_", num2str(i),".csv"]);
>>>>>>> dcbfc020e8bdd06bcbada47b4af2943401321162
    groups{i+1} = group_buckets(lens);
endfor

newgroups = [];

for i = ns
    for k = ns
        newgroups(i) =
    endfor
endfor
