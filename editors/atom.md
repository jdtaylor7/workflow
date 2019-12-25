# Core
* Exclude VCS Ignored Paths: Checked
* Project Home: Relevant path

# Editor
* Show Indent Guide: Checked
* Tab Length: 4

# Keybindings
    'body':
        # Split screen with tmux-like bindings.
        'alt-shift-h': 'pane:split-left-and-copy-active-item'
        'alt-shift-j': 'pane:split-down-and-copy-active-item'
        'alt-shift-k': 'pane:split-up-and-copy-active-item'
        'alt-shift-l': 'pane:split-right-and-copy-active-item'

        # Focus panes with tmux-like bindings.
        'alt-h': 'window:focus-pane-on-left'
        'alt-j': 'window:focus-pane-on-down'
        'alt-k': 'window:focus-pane-on-up'
        'alt-l': 'window:focus-pane-on-right'

    'atom-workspace':
        # Save with my vim binding.
        ', s': 'core:save'

# Packages

### Core Packages
* autocomplete-plus
    * Show Suggestions On Keystroke: Disabled
* markdown-preview
* tree-view
    * Hide Ignored Names: Checked
    * Hide VCS Ignored Files: Checked

### Community Packages
* script: Adds code-running capability to Atom
* vim-mode-plus: Adds vim keybindings
* language-bazel: Adds syntax highlighting to Bazel files

# Themes
* UI Theme: One Dark
* Syntax Theme: Base16 Tomorrow Dark
