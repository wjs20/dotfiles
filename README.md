# Setup
To set up a new environment, run the bootstrap.sh script.
```
$ ./dotfiles/bootstrap.sh
```

# Testing
To test bootstrap script in clean environment, use provided Dockerfile (password developer)
```
$ docker build -t my_dev_env .
$ docker run --rm -it --mount typ=bind,source="$(pwd)",target=/home/developer/dotfiles my_dev_env
(docker) $ ./dotfiles/bootstrap.sh
```

# TODO
fix python linting in-editor support so messages are not duplicated between ruff and pylint
fix rust in-editor support (text being left behind after error fixed)
improve python autoformatting so it doesn't lose your place


# MISC
Look at [Rewritten in Rust: Modern Alternatives of Command-Line Tools](https://zaiste.net/posts/shell-commands-rust/) for inspiration
