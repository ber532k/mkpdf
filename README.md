# mkpdf

This is a simple command line wrapper around pandoc and latexmk
written in bash. It will generate pdf output from one or more files
written in pandoc's markdown.


## Installing

### Arch Linux

There is a package in the AUR, so use something like ``pacaur -S mkpdf``

### Manual Installation

Add the following files to your PATH and make sure they are executable:

- mkpdf
- furbishtex (optional)

If furbishtex is found in your PATH and executable it will be called
before running latexmk. See ``furbishtex -h`` for further explanation.

## Dependencies

Of course this program depends on

- pandoc
- texlive (or probably even some other latex distribution)

Also some basic command line utils are used, but these should be included
in every GNU/Linux system by default. If not please drop me a message.

## Usage

```
Usage: mkpdf [options] <directory>
   Or: mkpdf [options] [files]

Options:
  -c  --clean           Remove all temporary files and exit
  -d  --debug           Print latexmk's output
  -f  --fresh           Remove auxiliary files before running
                        latexmk
  -o  --output          Specify the name for the pdf output
  -p  --preview         Open pdf once generated
  -t  --template        Specify a template to use with pandoc
  -h  --help            Print this help and exit
      --help-toc        Print info on how to use toc-mode
      --basic-toc       Print an example of a basic toc.conf
      --advanced-toc    Print an advanced example for toc.conf


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
    - A template may be specified in any comment
      containing template="FILE". This comment should
      not contain anything else.
    - YAML-style headers will be passed on to pandoc
      and thus used directly in creating the output.
    - The remaining lines will be interpreted as paths
      pointing to markdown files to be included in the
      output in the same order they are specified.
```
