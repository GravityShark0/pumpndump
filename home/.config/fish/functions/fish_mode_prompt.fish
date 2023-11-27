function fish_mode_prompt
    if test "$fish_key_bindings" != fish_default_key_bindings
        set --local vi_mode_color
        set --local vi_mode_symbol
        switch $fish_bind_mode
            case default
                set vi_mode_color (set_color white --bold)
                set vi_mode_symbol N
            case insert
                set vi_mode_color (set_color cyan --bold)
                set vi_mode_symbol I
            case replace replace_one
                set vi_mode_color (set_color red --bold)
                set vi_mode_symbol R
            case visual
                set vi_mode_color (set_color brpurple --bold)
                set vi_mode_symbol V
        end
        echo -e "$vi_mode_color $vi_mode_symbol \x1b[0m "
    end
end
