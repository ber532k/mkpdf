install: mkpdf lib data bin
	install -Dm 755 -t /bin mkpdf
	install -Dm 644 -t /usr/lib/mkpdf/lib lib/*
	install -Dm 644 -t /usr/share/mkpdf data/*
	install -Dm 755 -t /usr/lib/mkpdf/bin bin/*
	install -Dm 644 -t /usr/lib/mkpdf/furbishtex furbishtex/*

remove:
	rm -rfv /bin/mkpdf /usr/lib/mkpdf /usr/share/mkpdf
