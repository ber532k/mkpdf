# mkpdf

This is a simple command line wrapper around pandoc and latexmk written in
shell script and tested with both bash and dash, so it should hopefully be
POSIX-compliant. It will generate pdf output from one or more files written in
pandoc's markdown using a specified template.


## Installing

### Arch Linux

There is a package in the AUR, so use something like `pacaur -S mkpdf`

### Debian

Run `make deb` to create a package for debian. Or just download an
already-built package from the releases page.

### Manual Installation

Add the following files to your PATH and make sure they are executable:

- mkpdf
- furbishtex (optional postprocessor)
    * If furbishtex is found in your PATH and executable, it will be called
      before running latexmk. See ``furbishtex -h`` for further explanation.
    * for furbishtex to do something you will also want to
      move ``default.sed`` to ``/usr/share/furbishtex`` or
      at least to ``$HOME/.furbishtex`` for a user-specific
      installation

A manpage (`mkpdf.1.gz`) can be generated from [docs.md](docs.md) uing `make
man`. This file usually has to be moved to `/usr/share/man/man1` to make it
globally available.

Install instructions are also contained in the makefile, so you can probably
also run `sudo make install` to set everything up.


## Dependencies

Of course this program depends on

- pandoc
- latexmk
- texlive (or probably even some other latex distribution)

Also some basic command line utils are used, but these should be included
in every GNU/Linux system by default. Please drop me a message, if this is
not the case.

## Usage (v0.3 – coming soon)

```
Usage: mkpdf [options] <directory>
   Or: mkpdf [options] <files>

Options:
  -c  --clean           Remove temporary files before running
                        latexmk
  -d  --debug           Do not hide latexmk's output
  -o  --output          Specify a name for the output file
  -p  --preview         Open pdf once generated
  -t  --template        Specify a template to use with pandoc
  -h  --help            Print this help message and exit

Pandoc-Options:
  -M  --metadata        These options will be passed on to pandoc.
                        Please refer to pandoc's documentation for
                        further information on what they do.

Specifying templates:
    If no template is set from the command line, mkpdf will check
    metadata from input files for a field named 'template' and use
    it's value as the template name. If multiple templates are
    specified, any but the first one will be ignored.
```

Further information can also be found in [docs.md](docs.md), which can also be used to
generate a manpage.
