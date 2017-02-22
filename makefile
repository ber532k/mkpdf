install: install_mkpdf install_furbishtex

install_mkpdf: mkpdf
	install -m 755 -t /bin mkpdf

install_furbishtex: furbishtex default.sed
	install -m 755 -t /bin furbishtex
	mkdir -p /usr/share/furbishtex
	install -m 644 -t /usr/share/furbishtex default.sed
