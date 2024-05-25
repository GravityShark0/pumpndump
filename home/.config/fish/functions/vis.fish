function vis --wraps=echo\ \'\ sl\'\ \|\ nvim\ -s\ -\; --wraps=echo\ \'\ sl\'\ \|\ nvim\ \ -s\ -\; --description alias\ vis=echo\ \'\ sl\'\ \|\ nvim\ -s\ -\;
  echo ' sl' | nvim $argv -s -; 
        
end
