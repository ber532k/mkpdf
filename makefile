install: install_mkpdf install_furbishtex

install_mkpdf: mkpdf
	install -Dm 755 -t /bin mkpdf
	install -Dm 644 -t /usr/lib/mkpdf lib/*
	install -Dm 644 -t /usr/share/mkpdf data/*

install_furbishtex: furbishtex default.sed
	install -Dm 755 -t /bin furbishtex
	install -Dm 644 -t /usr/share/furbishtex default.sed

remove_furbishtex:
	rm -r /bin/furbishtex /usr/share/furbishtex
