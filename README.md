# omz-git
This is an [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh) plugin
that has git functionality that The Network uses. Right now, its only
function is to modify the console prompt play more nicely with our
branch naming conventions.

To install this plugin, you can use `sh -c "$(curl -fsSL https://raw.github.com/tnwinc/omz-git/master/install-plugin.sh)"`. You can then add the plugin to your .zshrc. Alternatively, you can clone the repo into your ~/.oh-my-zsh/custom/plugins directory and do the same.

##Branch Naming
By default, this plugin will truncate branch names to 20 characters
total. Also by default, if detected, the team name at the beginning of
the branch will not be displayed. However, it does make sure that the
Pivotal Tracker ID will always be included at the end.

So, with the default settings, a branch like `pt-custom-list-doesnt-return-results-if-there-are-values-for-hire-date-96306202` will
be displayed as `custom-li...96306202`.

This is customizable in a few ways. You can set these options using git
config --global oh-my-zsh.\<option name> n.

* max-branch-length - the maximum length of branch name that will be
  displayed in your prompt. Defaults to 20.
* prefix-length - removes n characters from the beginning of the branch
  name. Useful if a lot of your branches have a fix-length prefix.
Defaults to 0 with manual install, set to 3 by install script.
* suffix-length - ensures that n characters at the end of the branch
  name are included in the output. Useful if you have an ID or other
fixed-length identifier appended to the branch name. Defaults to 0 with
manual install , set to 8 by install script.
