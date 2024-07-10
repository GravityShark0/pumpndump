if status is-interactive
    if not source $__fish_user_data_dir/plugins/plug.fish/conf.d/plugin_load.fish
        echo -e "plug.fish doesn't seem to exist, trying to install"
        curl -L https://github.com/kidonng/plug.fish/raw/v3/conf.d/plugin_load.fish | source
        #set_color green; echo -e "To install plug.fish do: \ncurl -L https://github.com/kidonng/plug.fish/raw/v3/conf.d/plugin_load.fish | source"
        #set_color normal
    end
    fzf_key_bindings        
    zoxide init fish | source
end
