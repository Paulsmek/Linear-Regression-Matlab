function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_csv_file implementation
  data = fileread(file_path); % citesc datele din fisier
  linii = strsplit(data , '\n'); % impart data in linii
  m = length(linii); % cate linii am
  %calculez cate coloane am dupa ce impart cellurile din linia 1
  dummy = strsplit(linii{1}, ',');
  n = length(dummy) - 1;
  InitialMatrix = cell(m,n + 1);
  for i= 1:m
    %aceeasi impartire ca mai sus (linia 1)
    temp = strsplit(linii{i}, ',');
    for j= 1:n+1
      if j == 1
        InitialMatrix{i, j} = str2num(temp{j});% Y va fi de tip numeric
      else
        InitialMatrix{i, j} = temp{j};
      endif
      
    endfor
  endfor
  Y = cell2mat(InitialMatrix(:,1)); % Y este de tip matrice cu numere
  InitialMatrix(:, 1) = []; %sterg partea lui Y
  InitialMatrix(1, :) = [];  % sterg prima linie care nu ma intereseaza
  
endfunction