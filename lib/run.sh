run_pandoc() {
    echo "    Converting files to latex"
    echo --template=$template $pandoc_options > $tmpdir/pandoc.options
    pandoc --template=$template $pandoc_options

    # Exit on error
    if ! [[ -f $tmpdir/master.tex ]]; then
        echo "  FATAL: pandoc failed to generate master.tex"
        exit 1
    fi

}

run_latexmk() {
    if [[ $fresh_runs = 1 ]] && [[ -d $tmpdir/latexmk ]]; then
        echo "    Removing auxiliary files"
        rm -rf $tmpdir/latexmk
    fi

    # Set up latexmk tmpdir
    ! [[ -d $tmpdir/latexmk ]] && mkdir "$tmpdir/latexmk"


    echo "    Running latexmk"

    cd "$reldir"
    if [[ $debug_info = 1 ]]; then
        latexmk --xelatex --outdir=$tmpdir/latexmk $tmpdir/master.tex
    else
        latexmk --xelatex --outdir=$tmpdir/latexmk $tmpdir/master.tex &>> $tmpdir/latexmk.log
    fi
    cd "$destdir"

    # Exit on error
    if ! [[ -f $tmpdir/latexmk/master.pdf ]]; then
        echo "  FATAL: Latexmk failed to generate pdf file"
        exit 1
    fi
}
