print_help() {
   cat <<EOF

Usage: mkpdf [options] <directory>
   Or: mkpdf [options] [files]

Options:
  -c  --clean           Remove all temporary files and exit
  -d  --debug           Print latexmk's output
  -f  --fresh           Remove auxiliary files before running
                        latexmk
  -o  --output          Specify a name for the output file
  -p  --preview         Open pdf once generated
  -t  --template        Specify a template to use with pandoc
      --set             Set a config-option from command line
  -h  --help            Print this help and exit
      --help-toc        Print info on how to use toc-mode
      --help-config     Print info on possible config options
      --example-toc     Print an example of a basic toc.conf

Specifying templates:
      If no template is set from the command line, mkpdf will check
      either toc.conf or the input files if any of them specify a
      variable like 'template: default.latex'. While this is also
      a usual (though probably not processed) variable for pandoc,
      mkpdf will use it to determine what template to use.

EOF
}

print_help_config() {
   cat <<EOF

Some user-specific defaults can be set in \$HOME/.config/mkpdf/config
Here is an example config file containing all possible options:

________________________________________________________________

# mkpdf configuration file

# template to be used as default and fallback
default_template=default.latex

# List of directories where mkpdf is supposed to look
# for templates (separated by spaces)
template_dirs="/usr/share/pandoc/data/templates \$HOME/.templates"

# Implicitly set -d flag by default
debug_info=0

# Implicitly set -p flag by default
auto_preview=0

# Use mkpdfs own filter for handouts when the output
# is not beamer?
# This will strip paragraphs reading "---" or ". . ."
# before writing standard latex output.
handout_filter=1

# Use furbishtex postprocessor for improving typography in the
# pandocs output (may lead to problems if used on codeblocks)
furbishtex_postprocessor=1

# Implicitly set -f flag by default
fresh_runs=0
________________________________________________________________

EOF
}

print_help_toc() {
   cat <<EOF

mkpdf toc-mode:

  You may include a 'toc.conf' text file in a directory
  and run mkpdf in that directory or with the directory
  as an argument.

  toc.conf syntax:
    - Empty lines will be ignored
    - Comments will also be ignored:
        * Bash-style comments starting with #
        * Latex-style comments starting with %
        * HTML-style comments (either single- or multi-
          line)
    - YAML-style headers will be passed on to pandoc
      and thus used directly in creating the output.
    - The remaining lines will be interpreted as paths
      pointing to markdown files to be included in the
      output in the same order they are specified.

EOF
}

print_basic_toc() {
   cat <<EOF

---
author: Max Mustermann
title: Some example document
template: default.latex
---

# Intro
intro.txt

# Chapters
ch1.txt
ch2.txt

EOF
}
