# Installing TeX Live
TeX Live provides all the underlying tools that comprise a LaTeX implementation,
including a LaTeX compiler (latexmk) and pdf converter (pdflatex). It's an
alternative to MiKTeX.

On Windows, you simply need to install the toolset from the [website](https://tug.org/texlive/)
with all of the default settings. This will install all necessary tools and add
the necessary directories to your PATH.

# Integrating TeX Live with Atom
If using Atom as your editor, you need to install the packages `latex`,
`language-latex`, and `pdf-view`. Within the `latex` package settings, you must
specify the install directory of the LaTeX packages. This is all documented in
`editors/atom.md`.
