# mkpdf

This is a simple command line wrapper around pandoc and latexmk
written in bash. It will generate pdf output from one or more files
written in pandoc's markdown using a specified template.


## Installing

### Arch Linux

There is a package in the AUR, so use something like `pacaur -S mkpdf`

### Debian

Run `make deb` to create a package for debian. Or just download the
already-built package from the releases page.

### Manual Installation

Since the functionality is split up into multiple files that are sourced from
the main script, Installing it manually is not too straight forward at the
moment. You can run `sudo make install` to set everything up or just take a
peek into the makefile to see how it is done currently.

I realize that this is anything but ideal and will try to reunite all the
components into a single shell script with some future release, so that
installing it will again be a simple matter of making the `mkpdf` executable
available in your `PATH`.

## Dependencies

Of course this program depends on

- pandoc
- latexmk
- texlive (or probably even some other latex distribution)

Also some basic command line utils are used, but these should be included
in every GNU/Linux system by default. Please drop me a message, if this is
not the case.

## Usage (v0.2.1)

```
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
```
