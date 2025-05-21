# Setup
To set up a new environment, run the bootstrap.sh script.
```
$ ./dotfiles/bootstrap.sh
```

# Testing
To test bootstrap script in clean environment, use provided Dockerfile (password developer)
```
$ docker build -t my_dev_env .
$ docker run --rm -it --mount type=bind,source="$(pwd)",target=/home/developer/dotfiles my_dev_env
(docker) $ ./dotfiles/bootstrap.sh
```

# TODO
- fix Blink completion library ins-mode line completion
- fix two lists coming up


# MISC
Look at [Rewritten in Rust: Modern Alternatives of Command-Line Tools](https://zaiste.net/posts/shell-commands-rust/) for inspiration
