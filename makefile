install: mkpdf lib data bin
	install -Dm 755 -t /bin mkpdf
	install -Dm 644 -t /usr/lib/mkpdf/lib lib/*
	install -Dm 644 -t /usr/share/mkpdf data/*
	install -Dm 755 -t /usr/lib/mkpdf/bin bin/*
	install -Dm 644 -t /usr/lib/mkpdf/furbishtex furbishtex/*

remove:
	rm -rfv /bin/mkpdf /usr/lib/mkpdf /usr/share/mkpdf

mkpdf_all.deb: mkpdf lib data bin deb-control
	mkdir -p mkpdf_all/DEBIAN
	cp deb-control mkpdf_all/DEBIAN/control
	install -Dm 755 -t mkpdf_all/bin mkpdf
	install -Dm 644 -t mkpdf_all/usr/lib/mkpdf/lib lib/*
	install -Dm 644 -t mkpdf_all/usr/share/mkpdf data/*
	install -Dm 755 -t mkpdf_all/usr/lib/mkpdf/bin bin/*
	install -Dm 644 -t mkpdf_all/usr/lib/mkpdf/furbishtex furbishtex/*
	dpkg-deb --build mkpdf_all

.PHONY deb: mkpdf_all.deb
