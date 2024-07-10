function lx --wraps='ls --sort-ext' --wraps='ls --sort=ext' --wraps='ls --sort=inode' --description 'alias lx ls --sort=ext'
  ls --sort=ext $argv
        
end
