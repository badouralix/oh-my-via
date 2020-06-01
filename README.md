# VIA theme for ZSH

[![Build Status](https://travis-ci.org/badouralix/oh-my-via.svg?branch=master)](https://travis-ci.org/badouralix/oh-my-via)
[![WTFPLv2 License](https://img.shields.io/badge/license-WTFPLv2-blue.svg)](http://www.wtfpl.net)

This is a theme for ZSH which mainly forks the historical theme used on
[VIA Centrale Réseaux](https://via.l4th.fr/) servers. It can be used with
ZSH frameworks such as [Oh-My-ZSH](https://github.com/robbyrussell/oh-my-zsh).

- [Preview](#preview)
- [Info](#info)
  - [VCS caption](#vcs-caption)
- [Usage](#usage)
  - [Install for Oh-My-ZSH](#install-for-oh-my-zsh)
  - [Customization](#customization)
    - [Date and time](#date-and-time)
    - [Context ( user and hostname )](#context--user-and-hostname-)
    - [Working directory](#working-directory)
    - [VCS theme](#vcs-theme)
- [Unit testing](#unit-testing)
- [License](#license)

## Preview

![Oh-My-VIA theme preview](https://user-images.githubusercontent.com/19719047/83419205-00a85b00-a425-11ea-861b-1ad1a957f11c.png "Oh-My-VIA theme preview")

See on [Docker Hub](https://hub.docker.com/r/badouralix/oh-my-via/) for a testing image.

## Info

### VCS caption

| Color  | State                      | Variable                      |
|:------:|:--------------------------:|:-----------------------------:|
| red    | there are unstaged files   | `OHMYVIA_VCS_COLOR_UNSTAGED`  |
| yellow | there are staged files     | `OHMYVIA_VCS_COLOR_STAGED`    |
| blue   | there are untracked files  | `OHMYVIA_VCS_COLOR_UNTRACKED` |
| cyan   | stash stack is not empty   | `OHMYVIA_VCS_COLOR_STASH`     |
| green  | working directory is clean | `OHMYVIA_VCS_COLOR_CLEAN`     |

## Usage

### Install for Oh-My-ZSH

In order to use this theme, you have to clone this repository in your Oh-My-ZSH
`custom/themes` directory ( usually `~/.oh-my-zsh/custom/themes` ) :

```zsh
git clone https://github.com/badouralix/oh-my-via.git $ZSH/custom/themes/oh-my-via
```

You then need to select this theme in your `~/.zshrc` :

```zsh
ZSH_THEME="oh-my-via/via"
```

### Customization

Prompt is composed of several widgets that are displayed one after the other.

#### Date and time

| Variable              | Description                      | Default      |
|:---------------------:|:-------------------------------- |:------------:|
| `OHMYVIA_TIME_COLOR`  | Background and foreground color. | `%B%F{cyan}` |
| `OHMYVIA_TIME_FORMAT` | Display date and time.           | `%D{%H:%M}`  |

#### Context ( user and hostname )

Context prompt showing `user@hostname`.

| Variable                          | Description                                                                                       | Default        |
|:---------------------------------:|:------------------------------------------------------------------------------------------------- |:--------------:|
| `OHMYVIA_CONTEXT_HOSTNAME`        | Display hostname. Set to `partial` to print up to the first `.`. Set to `empty` to hide hostname. | `full`         |
| `OHMYVIA_CONTEXT_HOSTNAME_COLOR`  | Hostname background and foreground color.                                                         | `%B%F{white}`  |
| `OHMYVIA_CONTEXT_SEPARATOR_COLOR` | `@` separator between the user and the hostname background and foreground color.                  | `%B%F{yellow}` |
| `OHMYVIA_CONTEXT_ROOT_COLOR`      | Root username background and foreground color.                                                    | `%B%F{blue}`   |
| `OHMYVIA_CONTEXT_USER_COLOR`      | Non-root username background and foreground color.                                                | `%B%F{red}`    |

#### Working directory

| Variable            | Description                                                                                                                                       | Default       |
|:-------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------- |:-------------:|
| `OHMYVIA_DIR_COLOR` | Background and foreground color.                                                                                                                  | `%B%F{green}` |
| `OHMYVIA_DIR_SIZE`  | Number of trailing components of the current directory to show. Set to `0` to show the whole path. Set to `1` to show only the current directory. | `0`           |

#### VCS theme

| Variable             | Description                                                           | Default   |
|:--------------------:|:--------------------------------------------------------------------- |:---------:|
| `OHMYVIA_VCS_THEME`  | Git prompt theme ( see [available themes](functions/vcs_themes.zsh) ) | `default` |

## Unit testing

Oh-My-VIA uses [ZUnit](https://github.com/molovo/zunit) as unit testing framework.

To run the tests, just run:

```zsh
zunit test
```

## License

Unless explicitly stated to the contrary, all contents licensed under the [WTFPL](LICENSE).
