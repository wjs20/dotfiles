#TODO

fix python linting in-editor support so messages are not duplicated between ruff and pylint
fix rust in-editor support (text being left behind after error fixed)
fix winyank error on delete and yank
remove html autocommand, disorientating
improve python autoformatting so it doesn't lose your place
seperate out work specific path additions.


# Walkthrough for setting up a new linux environment

```bash
apt update
apt install sudo
adduser ws
usermod -aG sudo ws
su ws
sudo apt install git
ssh-keygen
eval "$(ssh-agent)"
# Add key to github
git clone git@github.com:wjs20/dotfiles
sudo apt install stow
cd dotfiles
stow {ignore,git,config,vim,tmux,zsh}
cd ../
bash dotfiles/bootstrap.sh
```
