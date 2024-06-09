set_color red
if not source $__fish_user_data_dir/plugins/plug.fish/conf.d/plugin_load.fish
    set_color green; echo -e "To install plug.fish do: \ncurl -L https://github.com/kidonng/plug.fish/raw/v3/conf.d/plugin_load.fish | plugins=https://github.com/kidonng/plug.fish source"
end
set_color normal

if status is-interactive
    fzf_key_bindings        
    zoxide init fish | source
    
end
