# Core
* Exclude VCS Ignored Paths: Enabled
* Project Home: Relevant path
* Use Tree Sitter Parsers: Disabled (fixes syntax highlighting of TODO
    statements in C++)

# Editor
* Show Indent Guide: Enabled
* Tab Length: 4

# Keybindings
Copy `keymap.cson` into `~/.atom`.

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
* LaTeX packages
    * latex: Coordinates calling of LaTeX commands
        * TeX path: $PATH
    * language-latex: Syntax highlighting
    * pdf-view: Provides in-editor viewing
* pigments
    * Marker Type: native-dot

# Themes
* UI Theme: One Dark
* Syntax Theme: Base16 Tomorrow Dark

# Styles
Copy `styles.less` into `~/.atom`.
