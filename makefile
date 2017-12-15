install: mkpdf furbishtex/furbishtex furbishtex/default.sed
	install -Dm 755 mkpdf /usr/bin/mkpdf
	install -Dm 755 furbishtex/furbishtex /usr/bin/furbishtex
	install -Dm 644 furbishtex/default.sed /usr/lib/furbishtex/default.sed

remove:
	rm -rf /usr/bin/mkpdf /usr/bin/furbishtex /usr/lib/furbishtex

mkpdf_all.deb: mkpdf furbishtex/furbishtex furbishtex/default.sed
	mkdir -p mkpdf_all/DEBIAN
	cp deb-control mkpdf_all/DEBIAN/control
	install -Dm 755 mkpdf mkpdf_all/usr/bin/mkpdf
	install -Dm 755 furbishtex/furbishtex mkpdf_all/usr/bin/furbishtex
	install -Dm 644 furbishtex/default.sed mkpdf_all/usr/lib/furbishtex/default.sed
	dpkg-deb --build mkpdf_all

.PHONY deb: mkpdf_all.deb
