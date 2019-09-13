# dotfiles

## To install

    # Bootstraping the installation by checking system requirements and cloning the repo
    $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/aallrd/dotfiles/master/bootstrap)"
    
    # Listing installation options
    $ make help

    # Performing full installation
    $ make

## Updating

```
$ git submodule foreach git pull origin master
$ git submodule update .vim/bundle/*
```

## Sources 

- [pacapt](https://github.com/icy/pacapt)
- [jessfraz/dotfiles](https://github.com/jessfraz/dotfiles)
