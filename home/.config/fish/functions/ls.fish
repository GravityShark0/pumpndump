function ls --wraps=eza --wraps='eza --icons --group-directories-first --sort=name' --description 'alias ls=eza --icons --group-directories-first --sort=name'
  eza --icons --group-directories-first --sort=name $argv
        
end
