<h1 align="center">🦙 Personal nvim setup</h1>

<div>
  <h4 align="center">
    <a href="#install">Install</a> ·
    <a href="#dependencies">Dependencies</a> ·
    <a href="#usage">Usage</a>
  </h4>
</div>
<div align="center">
  <a href="https://github.com/marco-souza/nvim/releases/latest"
    ><img
      alt="Latest release"
      src="https://img.shields.io/github/v/release/marco-souza/nvim?style=for-the-badge&logo=starship&logoColor=D9E0EE&labelColor=302D41&&color=d9b3ff&include_prerelease&sort=semver"
  /></a>
  <a href="https://github.com/marco-souza/nvim/pulse"
    ><img
      alt="Last commit"
      src="https://img.shields.io/github/last-commit/marco-souza/nvim?style=for-the-badge&logo=github&logoColor=D9E0EE&labelColor=302D41&color=9fdf9f"
  /></a>
  <a href="https://github.com/neovim/neovim/releases/latest"
    ><img
      alt="Latest Neovim"
      src="https://img.shields.io/github/v/release/neovim/neovim?style=for-the-badge&logo=neovim&logoColor=D9E0EE&label=Neovim&labelColor=302D41&color=99d6ff&sort=semver"
  /></a>
  <a href="http://www.lua.org/"
    ><img
      alt="Made with Lua"
      src="https://img.shields.io/badge/Built%20with%20Lua-grey?style=for-the-badge&logo=lua&logoColor=D9E0EE&label=Lua&labelColor=302D41&color=b3b3ff"
  /></a>
</div>
<hr />

This project is my neovim setup (`nvim`).

It setups up a few basic thigs like:
- editor configs
- colorscheme
- mappings
- plugins
- games
- treesitter


## Install

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:marco-souza/nvim ~/.config/marco-souza/nvim
nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
nvim
```

## Dependencies

None, but `lazy.nvim` will be installed automatically.

You will also need to use `git` to clone this project.

## Usage

```sh
# backup old config
mv $HOME/config/nvim $HOME/config/nvim.bkp

# clone config
git clone git@github.com:marco-souza/nvim.git $HOME/.config/nvim
# or
git clone https://github.com/marco-souza/nvim.git $HOME/.config/nvim
```

