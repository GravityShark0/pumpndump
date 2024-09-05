function l --wraps=ls --description 'alias l ls'
  eza --icons --long --all --sort=time --time=accessed $argv
end
