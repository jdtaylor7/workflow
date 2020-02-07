# Core
* Exclude VCS Ignored Paths: Enabled
* Project Home: Relevant path

# Editor
* Show Indent Guide: Enabled
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

    '.platform-win32 atom-text-editor':
        # ctags goto and return from, respectively.
        'f8': 'atom-ctags:go-to-declaration'
        'alt-f8': 'atom-ctags:return-from-declaration'

    '.platform-win32,.platform-linux':
        # Atom search and replace.
        'f1': 'find-and-replace:show'

# Packages

### Core Packages
* autocomplete-plus
    * Show Suggestions On Keystroke: Disabled
* markdown-preview
* tree-view
    * Hide Ignored Names: Enabled
    * Hide VCS Ignored Files: Enabled

### Community Packages
* script: Adds code-running capability to Atom
* vim-mode-plus: Adds vim keybindings
* language-bazel: Adds syntax highlighting to Bazel files
* language-cmake: Adds syntax highlighting to CMake files
* atom-ctags: Adds tag generation to allow jumping to declarations
    * Automatically rebuild tags: Enabled
    * Keybindings: Disabled
    * After installation, restart Atom once or twice for it to start working

# Themes
* UI Theme: One Dark
* Syntax Theme: Base16 Tomorrow Dark
