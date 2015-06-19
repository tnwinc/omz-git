
#Setup for tnwinc branch names
git config --global oh-my-zsh.prefix-length 0
git config --global oh-my-zsh.prefix-regex "[^-]*-"
git config --global oh-my-zsh.suffix-length 8

#Aliases
git config --global alias.slog "log -n 10 --format=format:'%Creset%an %Cgreen%ar:%Creset%s %Cred%h'"
git config --global alias.ci "!git add -A && git commit"
git config --global alias.tracking "for-each-ref --format='%(refname:short) <- %(upstream:short)' refs/heads"
git config --global alias.s "status --short"
