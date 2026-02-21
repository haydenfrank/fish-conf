function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
    set fish_greeting

    # Use starship
    starship init fish | source
    if not set -q TMUX
        # Use the theme written by the waybar switcher (if present), else fall back
        # to gruvbox. switch-colors writes the active theme name to
        # ~/.config/fish/current_theme and also writes an optional
        # terminal-sequences/active.txt file.
        set -l theme_file "$HOME/.config/fish/current_theme"
        if test -f "$theme_file"
            set -g theme (string trim (cat "$theme_file"))
        else
            set -g theme gruvbox
        end

        set -l seq_file "$HOME/.config/fish/terminal-sequences/$theme.txt"
        if test -f "$seq_file"
            cat "$seq_file"
        else if test -f "$HOME/.config/fish/terminal-sequences/active.txt"
            cat "$HOME/.config/fish/terminal-sequences/active.txt"
        end
    end

    clear

    # Aliases
    alias clear "printf '\033[2J\033[3J\033[1;1H'" # fix: kitty doesn't clear properly
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"
    alias ls 'eza --icons'
    alias pamcan pacman
    alias q 'qs -c ii'

end

# opencode
fish_add_path /home/hayden/.opencode/bin
