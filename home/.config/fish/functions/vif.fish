function vif --wraps=nvim\ -c\ \':Telescope\ find_files\ find_command=fd\' --description alias\ vif=nvim\ -c\ \':Telescope\ find_files\ find_command=fd\'
  nvim -c ':Telescope find_files' $argv
        
end
