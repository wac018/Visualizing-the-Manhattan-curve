ns = [0:22];

groups = cell(1,columns(ns));

for i = ns
    lens = csvread(["lengths_row_t_1", num2str(i),".csv"]);
    groups{i+1} = group_buckets(lens);
endfor

newgroups = [];

for i = ns
    for k = ns
        newgroups(i) =
    endfor
endfor
