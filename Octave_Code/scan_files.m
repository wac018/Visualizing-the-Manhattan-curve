function scan_files(initialPath, extensions, fileHandler)
  persistent total = 0;
  persistent depth = 0; depth++;
  initialDir = dir(initialPath);

  printf('Scanning the directory %s ...\n', initialPath);

  for idx = 1 : length(initialDir)
    curDir = initialDir(idx);
    curPath = strcat(curDir.folder, '\', curDir.name);

    if regexp(curDir.name, "(?!(\\.\\.?)).*") * curDir.isdir
      scanFiles(curPath, extensions, fileHandler);
    elseif regexp(curDir.name, cstrcat("\\.(?i:)(?:", extensions, ")$"))
      total++;
      file = struct("name",curDir.name,
                     "path",curPath,
                     "parent",regexp(curDir.folder,'[^\\\/]*$','match'),
                     "bytes",curDir.bytes);
      fileHandler(file);
    endif
  end

  if!(--depth)
    printf('Total number of files:%d\n', total);
    total=0;
  endif
endfunction
