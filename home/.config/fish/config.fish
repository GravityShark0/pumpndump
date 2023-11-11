# if status is-interactive
#     # ~/.tmux/plugins
#     fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
#     # ~/.config/tmux/plugins
#     fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin
# end

zoxide init fish | source
if status is-interactive
    alias cd="echo pls use 'z' instead thx :3"
end
