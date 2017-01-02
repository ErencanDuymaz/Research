% request Ahmet's grade
gahmet = input ( 'Enter Ahmet s grade');

gdeniz = input ( 'Enter Deniz s grade');
gselin = input ( 'Enter Selin s grade');

matrix = [ gahmet , gdeniz , gselin];

% where all grades are greater than 50 

if ( gahmet > 50 && gdeniz > 50 && gselin > 50 )
    if ( max(matrix) == gahmet)
        {
            fprintf( 'Ahmet has AA');
            matrix2 =matrix(matrix~=max(matrix));
            if ( max(matrix) == gdeniz )
            {
            fprintf( ' Deniz has BA');
            fprintf( ' Selin has BB');
            }
            end 
            if ( max(matrix) == gselin )
            {
            fprintf( ' Deniz has BB');
            fprintf( ' Selin has BA');
            }
            end 
            
            
            
        }
    end
    
    
    
    
end 



