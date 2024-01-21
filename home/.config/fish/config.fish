# To install plug.fish
# curl -L https://l0c.cc/plug.fish | plugins=https://github.com/kidonng/plug.fish source

source $__fish_user_data_dir/plugins/plug.fish/conf.d/plugin_load.fish

if status is-interactive
    zoxide init fish | source
    # alias cd="echo pls use 'z' instead thx :3"
end
