################################################################################                                
# Settings                                                                                                      
################################################################################                                

# P4 Variables 

export P4PORT=perforce.freebsd.org:1666
export P4USER=truncs
export P4PASSWD=
export P4CLIENT=aditya
export P4DIFF=/usr/bin/diff

# Perforce 
if [[ -e $HOME/.p4config ]]; then
        source ~/.bashrc         
fi                               

# Anon CVS options
export CVSROOT=:pserver:anoncvs@anoncvs.tw.FreeBSD.org:/home/ncvs

# Bash like Prompt
PROMPT="[%n@%M:%~]%# "  

# History options.
export HISTFILE=~/.zsh_history
export HISTSIZE=5000          
export SAVEHIST=5000          
setopt hist_ignore_dups # ignore same commands run twice+
setopt appendhistory    # don't overwrite history        

# Generic shell options.
setopt nopromptcr     # don't add \n which overwrites cmds with no \n
setopt nobeep         # i hate beeps                                 
setopt noautomenu     # don't cycle completions                      
setopt autocd         # change to dirs without cd                    
setopt autopushd      # push directories by default                  
setopt nocheckjobs    # don't warn me about bg processes when exiting
setopt nohup          # and don't kill them, either                  
setopt completeinword # not just at the end                          
setopt alwaystoend    # when complete from middle, move cursor       
setopt extendedglob   # Nice things like *~*.c globs all but .c files
#setopt menucomplete   # Don't stop completing at ambiguities        

# Use emacs style editing
bindkey -e               

################################################################################
# Aliases                                                                       
################################################################################

# Global aliases; expanded anywhere on the line.
alias -g ...='../..'                            
alias -g ....='../../..'                        
alias -g .....='../../../..'                    
alias -g CA="2>&1 | cat -A"                     
alias -g C='| wc -l'                            
alias -g G='| egrep'                            
alias -g H='| head'                             
alias -g M='| most'                             
alias -g L='| less'                             
alias -g MM="2>&1 | most"                       
alias -g N="> /dev/null 2>&1"                   
alias -g V="| vim -"                            

# Aliases.
alias ls='ls -G'
alias lsd='ls -d'
alias ll='ls -l' 
alias la='ls -a' 
alias lla='ls -la'
alias l=ls        

# Shortcut aliases
alias f='find 2>/dev/null | grep'
alias g='grep -d recurse'        
alias m=most                     
alias p='ps -aux'                

# dvorak/us
alias aoeu='setxkbmap us'
alias asdf='setxkbmap dvorak'

# Debian specific aliases
#alias apt='sudo aptitude'
#alias apu='sudo aptitude update'
#alias api='sudo aptitude install'

# Path for my goodies.
export PATH=/sbin:/usr/sbin:/usr/local/sbin:/usr/X11R6/bin:~/bin:$PATH:/opt/clojure-contrib/launchers/bash

# Extended Globbing
setopt extended_glob
preexec () {        
    if [[ "$TERM" == "screen" ]]; then
    local CMD=${1[(wr)^(*=*|sudo|-*)]}
    echo -n "\ek$CMD\e\\"             
    fi                                
}                                     

################################################################################
# Completion
################################################################################


# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' '' '' 'r:|[._-]=* r:|=*'
zstyle :compinstall filename '/home/aditya/.zshrc'

autoload -Uz compinit
compinit

export EDITOR=vi


########################################################################
# For Clojure
#########################################################################

export CLOJURE_EXT=/usr/local/share/java/classes/
alias clj=clj-env-dir
