# Device installation scripts for MacOS

This repository houses some of the set up scripts that I use to get a new MacOS up-and-running.

- **Mac Setup** (`mac/`) contains:
  - `brew-essentials.sh` — installs applications via Homebrew: `source mac/brew-essentials.sh`
  - `electric-purple.terminal` — Terminal color theme

- **VSCode** (`vscode/`) contains:
  - `settings.json` — VSCode editor settings

- **Keyboard** (`keyboard/`) contains:
  - `portico.json` and `portico.layout.json` — Portico keyboard configurations for setting up layers and macros

- **Script Kit** (`scriptkit/`) contains:
  - `youtubevideoopener.js` — opens a random video from a given YouTube channel

- **Claude Code** (`.claude/`) contains:
  - `settings.json` — Claude Code settings
  - `hooks/session-start.sh` — creates a flag file at the start of each new session
  - `hooks/first-message.sh` — on the first message of a session, injects a prompt asking Claude to suggest a conversation name
  - `statusline-command.sh` — custom status line showing current directory, model, and context window usage

This repo was inspired by [zellwk dotfiles](https://github.com/zellwk/dotfiles)'s and his repo was a derivative of [mathiasbynens dotfiles](https://github.com/mathiasbynens/dotfiles)

Warning ⚠️: If you want to try out these dotfiles then you should fork this repository, review the code, and remove anything that you do not want. Please proceed with caution.
