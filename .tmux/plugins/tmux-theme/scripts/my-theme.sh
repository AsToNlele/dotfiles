#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
  
  status="$(defaults read -g AppleInterfaceStyle 2>/dev/null)"
  
  white='#F8F8F2'
  gray='#454158'
  dark='#22212C'
  purple='#C6A6F7'
  green='#57E888'
  red='#EB6A66'
  yellow='#FFFF80'
  lightgray='#5A688B'
  pink='#EA8AC4'
  blue='#92DEEE'
  
  thm_bg="#eff1f5"
  thm_fg="#4c4f69"
  thm_cyan="#04a5e5"
  thm_black="#e6e9ef"
  thm_gray="#ccd0da"
  thm_magenta="#8839ef"
  thm_pink="#ea76cb"
  thm_red="#d20f39"
  thm_green="#40a02b"
  thm_yellow="#df8e1d"
  thm_blue="#1e66f5"
  thm_orange="#fe640b"
  thm_black4="#acb0be"
  thm_lightgray=default
  
  tmux set-option -g status-interval 1000
  if [[ "$status" == "Dark" ]]; then
      tmux set-option -g pane-active-border-style "fg=${red}"
      tmux set-option -g pane-border-style "fg=${gray}"

      tmux set-option -g message-style "bg=${gray},fg=${white}"

      tmux set-option -g status-style "bg=${gray},fg=${white}"

      tmux set-option -g status-left "#[bg=${green},fg=${dark}, bold] #S #[bg=${lightgray},fg=${white}]  #(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD) "
      # tmux set-option -g status-right "#[fg=${white},bg=${pink},nobold,nounderscore,noitalics] #($current_dir/battery.sh) #[fg=${dark},bg=${yellow},bold,nounderscore,noitalics] #($current_dir/datetime.sh) "
      tmux set-option -g status-right ""
      tmux set-option -g status-left-length 100
      tmux set-option -g status-right-length 100
      
      tmux set-window-option -g window-status-separator ''
      tmux set-window-option -g window-status-current-format "#[fg=${white},bg=${purple}] #I #W "
      tmux set-window-option -g window-status-format "#[fg=${white}]#[bg=${gray}] #I #W "
      tmux set-window-option -g window-status-activity-style "bold"
else
  tmux set-option -g pane-active-border-style "fg=${thm_red}"
  tmux set-option -g pane-border-style "fg=${thm_gray}"

  tmux set-option -g message-style "bg=${thm_bg},fg=${thm_fg}"

  tmux set-option -g status-style "bg=${thm_lightgray},fg=${thm_fg}"

  tmux set-option -g status-left "#[bg=${thm_blue},fg=${white}, bold] #S #[bg=${thm_gray},fg=${thm_blue}, nobold]  #(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD) "
  # tmux set-option -g status-right "#[fg=${white},bg=${thm_pink},nobold,nounderscore,noitalics] #($current_dir/battery.sh) #[fg=${thm_bg},bg=${thm_blue},bold,nounderscore,noitalics] #($current_dir/datetime.sh) "
  tmux set-option -g status-right ""
  tmux set-option -g status-left-length 100
  tmux set-option -g status-right-length 100
  
  tmux set-window-option -g window-status-separator ''
  tmux set-window-option -g window-status-current-format "#[fg=${white},bg=${thm_magenta}] #I #W "
  tmux set-window-option -g window-status-format "#[fg=${thm_red}]#[bg=${thm_lightgray}] #I #W "
  tmux set-window-option -g window-status-activity-style "bold"
fi
}
main
