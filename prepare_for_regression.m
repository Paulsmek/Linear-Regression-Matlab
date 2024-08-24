function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
    [m, n] = size(InitialMatrix); %marimea matricii InitialMatrix
    FeatureMatrix = ones(m, n + 1); % creez matricea FeatureMatrix
    %uneori tipul de furnished nu este la capat de linie, deci ma ocup de caz
    if strcmp(InitialMatrix{1,n}, 'semi-furnished') == 0  &&  strcmp(InitialMatrix{1,n}, 'unfurnished') == 0 && strcmp(InitialMatrix{1,n}, 'furnished') == 0
      FeatureMatrix(:, n + 1) = str2double(InitialMatrix(:,n));
    endif
    %adaptarea elementelor din InitialMatrix in FeatureMatrix
    for i= 1:m
      for j= 1:n 
        var = InitialMatrix{i ,j};
        if strcmp(InitialMatrix{i,j}, 'yes') % cazul yes
          FeatureMatrix(i,j) = 1;
          
        elseif strcmp(InitialMatrix{i,j}, 'no') % cazul no
          FeatureMatrix(i,j) = 0;
        %cazurile de furnished  
        elseif strcmp(InitialMatrix{i,j}, 'semi-furnished')
          printf("%d %d\n",i,j);
          FeatureMatrix(i,j) = 1;
          FeatureMatrix(i,j+1) = 0;

        elseif strcmp(InitialMatrix{i,j}, 'unfurnished')
          FeatureMatrix(i,j) = 0;
          FeatureMatrix(i,j+1) = 1;
          
        elseif strcmp(InitialMatrix{i,j}, 'furnished')
          FeatureMatrix(i,j) = 0;
          FeatureMatrix(i,j+1) = 0;
        %in cazul de csv file, chiar daca checkerul spune ca este corect, va mai fi un spatiu dupa tipul
        %de furnished, deci m-am ocupat de acest caz special
        elseif strcmp(InitialMatrix{i,j}(1:end-1), 'semi-furnished') 
          printf("%d %d\n",i,j);
          FeatureMatrix(i,j) = 1;
          FeatureMatrix(i,j+1) = 0;

        elseif strcmp(InitialMatrix{i,j}(1:end-1), 'unfurnished') 
          FeatureMatrix(i,j) = 0;
          FeatureMatrix(i,j+1) = 1;
          
        elseif strcmp(InitialMatrix{i,j}(1:end-1), 'furnished')
          FeatureMatrix(i,j) = 0;
          FeatureMatrix(i,j+1) = 0;
        %elementele "numerice", adica cele care nu sunt stringuri din cazurile de mai sus 
        %vor deveni din string in numeric  
        elseif j~=n     
          
          FeatureMatrix(i, j) = str2double(var);
          
       endif
      
    endfor
    endfor
    
endfunction