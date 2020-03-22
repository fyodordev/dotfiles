function fish_prompt
  # Cache exit status

  # AYS Setup colors
  set -l normal (set_color normal)
  set -l white (set_color FFFFFF)
  set -l turquoise (set_color 5fdfff)
  set -l orange (set_color df5f00)
  set -l hotpink (set_color df005f)
  set -l blue (set_color 53D1ED)
  set -l green (set_color 87ff00)
  set -l greeno (set_color -o 87ff00)
  set -l purple (set_color af5fff)
  set -l red (set_color FF0000)
  set -l redo (set_color -o FF0000)
  set -l yellow (set_color E0D757)
 
  # AYS Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color 5fdfff
  set -g __fish_git_prompt_color_flags df5f00
  set -g __fish_git_prompt_color_prefix white
  set -g __fish_git_prompt_color_suffix white
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_show_informative_status true 
 
  # AYS Env
  set -l last_status $status
  set -l __work_dir (string replace $HOME '~' (pwd))

  # AYS Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_user
    switch (id -u)
      case 0
	     set -g __fish_user '#'
      case '*'
	     set -g __fish_user ''
    end
  end
  set -g __fish_prompt_char '❯'

  # DEFAULT
  set -l ahead    "↑"
  set -l behind   "↓"
  set -l diverged "⥄ "
  set -l dirty    "⨯"
  set -l none     ""

  set -l normal_color     (set_color normal)
  #set -l success_color    (set_color $fish_pager_color_progress 2> /dev/null; or set_color cyan)
  #set -l error_color      (set_color $fish_color_error 2> /dev/null; or set_color red --bold)
  #set -l directory_color  (set_color $fish_color_quote 2> /dev/null; or set_color brown)
  #set -l repository_color (set_color $fish_color_cwd 2> /dev/null; or set_color green)

  #if test $last_command_status -eq 0
    #echo -n -s $success_color $fish $normal_color
    #else
    #echo -n -s $error_color $fish $normal_color
    #end

  if git_is_repo
    #if test "$theme_short_path" = 'yes'
    #  set root_folder (command git rev-parse --show-toplevel 2> /dev/null)
    #  set parent_root_folder (dirname $root_folder)
    #  set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    #end
    #echo -n -s " on " $repository_color (git_branch_name) $normal_color " "
    if git_is_touched
      set vcs_d_status $dirty
      set vcs_d_color $orange
    else
      set vcs_d_status (git_ahead $ahead $behind $diverged $none)
      set vcs_d_color
    end
    # Check if commit is stashed
    if vcs.stashed > /dev/null
      set vcs_d_stashed "*"
    else
      set vcs_d_stashed ""
    end
    if set d_branch_name (git_branch_name)
      set vcs_d_final $vcs_d_color"⎇ "$d_branch_name
    end
  end


  # CHAIN
  if vcs.present
    # Check if branch is dirty
    if vcs.dirty
      set vcs_color $orange
      set vcs_dirty "⨯"
      #set vcs_dirty "±"
    else
      set vcs_color $blue
      set vcs_dirty (git_ahead $ahead $behind $diverged $none)
    end
    # Check if commit is stashed
    if vcs.stashed > /dev/null
      set vcs_stashed "*"
    else
      set vcs_stashed ""
    end
    # Combine to vcs string
    if set branch_name (vcs.branch)
      set final_vcs $vcs_color"⎇ "$branch_name$vcs_dirty$vcs_stashed
      #set final_vcs $branch_name
    end
  end

  # BELOGLAZOV Set directory
  set -l __cwd (basename (prompt_pwd))
  
  # AYS Last status
  set -l __exit_code -1
  set -l __prompt 'y'
  if test $last_status -eq 0
    set __start $greeno'✓ '$__fish_user
    #set __prompt $greeno$__fish_prompt_char$greeno' ' 
    #set __exit_code $green'0'
  else
   set __start $redo'⨯ '$__fish_user
   #set __prompt $redo$__fish_user'x '
   #set __exit_code $redo$last_status
  end 

  # Line
  echo -sn $greeno$white$USER \
    $green'@'$__fish_prompt_hostname$white \
    ' '$white$__cwd$turquoise \
    ' '$final_vcs \
    ' '$green$__fish_user'❯ ';
  
end


