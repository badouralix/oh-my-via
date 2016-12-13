VIA theme for ZSH
=================


This is a theme for ZSH which mainly forks the historical theme used on
[VIA Centrale Réseaux](https://via.ecp.fr/) servers. It can be used with
ZSH frameworks such as [Oh-My-ZSH](https://github.com/robbyrussell/oh-my-zsh).


Usage
-----

### Install for Oh-My-ZSH

In order to use this theme, you have to clone this repository in your Oh-My-ZSH
`custom/themes` directory ( usually `~/.oh-my-zsh/custom/themes` ) :

```
git clone https://github.com/badouralix/oh-my-via.git $ZSH/custom/themes/oh-my-via
```

You then need to select this theme in your `~/.zshrc` :

```
ZSH_THEME="oh-my-via/via"
```

### Customization

Time format defaults to `%D{%H:%M}`, but can be overwritten by setting the variable
`OHMYVIA_TIME_FORMAT` in your `~/.zshrc`.


Testing
-------

See on [Docker Hub](https://hub.docker.com/r/badouralix/oh-my-via/) for a testing image.


License
-------

Unless explicitly stated to the contrary, all contents licensed under the [WTFPL](LICENSE)

