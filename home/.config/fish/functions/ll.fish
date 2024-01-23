function ll --wraps=ls --description 'List contents of directory using long format'
  eza --icons --group-directories-first --sort=name -lh $argv
end
