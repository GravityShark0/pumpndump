source $__fish_user_data_dir/plugins/plug.fish/conf.d/plugin_load.fish

zoxide init fish | source
if status is-interactive
    alias cd="echo pls use 'z' instead thx :3"
end
