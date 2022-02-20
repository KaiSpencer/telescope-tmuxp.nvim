# telescope-tmuxp
Manage tmuxp operations from Neovim with Telescope.nvim

## Installing

Install in the standard vim way, packer example below. 
### Packer

```lua
use 'KaiSpencer/telescope-tmuxp.nvim'
```

## Pickers

### Sessions

Load a tmuxp session, if the session is live switch to the session, if not then loads the session.

Under the hood uses the `tmuxp load` command.

Currently only supports .yml files in the ~/.tmuxp/ directory.

#### Usage

Telescope command
`:Telescope tmuxp sessions`

Invoke directly
`:lua require"telescope.extensions".tmuxp.sessions()`

