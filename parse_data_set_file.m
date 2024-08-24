function [Y, InitialMatrix] = parse_data_set_file(file_path)
  fid = fopen(file_path, 'r');
  %prima linie cu n si m
  linie = fgetl (fid);
  temp = strsplit(linie);
  m = str2num(temp{1});
  n = str2num(temp{2});
  InitialMatrix = cell(m, n+1); % creez InitialMatrix
  for i= 1:m
    %aceeasi impartire ca mai sus
    linie = fgetl (fid);
    temp = strsplit(linie, ' ');
    for j= 1:n+1
      if j == 1
        InitialMatrix{i, j} = str2num(temp{j}); % elementele din Y vor fi de tip numeric
      else
        InitialMatrix{i, j} =temp{j};
      endif
      
    endfor
  endfor
  Y = cell2mat(InitialMatrix(:,1)); % Y va fi de tip matrice
  InitialMatrix(:, 1) = []; % InitialMatrix va fi de tip cell
 
  fclose(fid);
endfunction