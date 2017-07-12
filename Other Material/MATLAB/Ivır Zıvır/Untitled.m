%
gradeahmet = input ( 'Enter Ahmet s grade \n');
gradedeniz = input ( 'Enter Deniz s grade \n');
gradeselin = input ( 'Enter Selin s grade \n');
matrix = [ gradeahmet, gradedeniz, gradeselin ]

if ( gradeahmet > 50 && gradedeniz > 50 & gradeselin> 50 )
    matrix2 = matrix(matrix~max(matrix))
   
    if(max(matrix)== gradeahmet)
        fprintf('Ahmet has AA ');
            
        if(max(matrix2)==gradedeniz
            fprintf('Deniz has BA ');
            fprintf('Selin has BB ');
        end
        if(max(matrix2)==gradeselin
            fprintf('Deniz has BB ');
            fprintf('Selin has BA ');
        end
    end
    
    if(max(matrix)== gradedeniz)
        fprintf('Deniz has AA ');
       
        if(max(matrix2)==gradedeniz
            fprintf( 'Ahmet has BA ');
            fprintf( 'Selin has BB ');
        end
        if(max(matrix2)==gradeselin
            fprintf('Ahmet has BB ');
            fprintf('Selin has BA ');
        end
    end
    
    if(max(matrix)== gradeselin)
        fprintf('Selin has AA ');
        
        if(max(matrix2)==gradedeniz
            fprintf('Deniz has BA ');
            fprintf('Ahmet has BB ');
        end
        if(max(matrix2)==gradeselin
            fprintf('Deniz has BB ');
            fprintf('Ahmet has BA ');
        end
    end   
end




