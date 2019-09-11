# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_show_informative_status 1
set __fish_git_prompt_hide_untrackedfiles 1
set __fish_git_prompt_color_branch FF00D7
set __fish_git_prompt_color_upstream_ahead 00FF5F
set __fish_git_prompt_color_upstream_behind FF025F

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function fish_prompt --description 'Write out the prompt'
    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (set_color FDFF00)(hostname|cut -d . -f 1)(set_color normal)
    end

    if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_prompt_user
    set -g __fish_prompt_user (set_color FF025F)
    end

    if not set -q __git_cb
    set __git_cb " on"(__fish_git_prompt)(set_color normal)""
    end

    if not set -q __fish_prompt_cwd
        set -g __fish_prompt_cwd (set_color 00FF5F)
    end

    printf '%s%s%s @ %s in %s%s%s%s\n🦄 ' "$__fish_prompt_user" $USER "$__fish_prompt_normal" $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb

end
