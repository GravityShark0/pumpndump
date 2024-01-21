function lo --wraps='ls --group --header --group-directories-first --oneline' --description 'alias lo=ls --group --header --group-directories-first --oneline'
  ls --group --header --group-directories-first --oneline $argv
end
