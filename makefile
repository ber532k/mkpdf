install: mkpdf furbishtex/furbishtex furbishtex/default.sed mkpdf.1.gz
	install -Dm 755 mkpdf /usr/bin/mkpdf
	install -Dm 755 furbishtex/furbishtex /usr/bin/furbishtex
	install -Dm 644 furbishtex/default.sed /usr/lib/furbishtex/default.sed
	install -Dm 644 mkpdf.1.gz /usr/share/man/man1/mkpdf.1.gz

remove:
	rm -rf /usr/bin/mkpdf /usr/bin/furbishtex /usr/lib/furbishtex /usr/share/man/man1/mkpdf.1.gz

.PHONY deb: mkpdf_all.deb
mkpdf_all.deb: mkpdf furbishtex/furbishtex furbishtex/default.sed mkpdf.1.gz
	mkdir -p mkpdf_all/DEBIAN
	cp deb-control mkpdf_all/DEBIAN/control
	install -Dm 755 mkpdf mkpdf_all/usr/bin/mkpdf
	install -Dm 755 furbishtex/furbishtex mkpdf_all/usr/bin/furbishtex
	install -Dm 644 furbishtex/default.sed mkpdf_all/usr/lib/furbishtex/default.sed
	install -Dm 644 mkpdf.1.gz mkpdf_all/usr/share/man/man1/mkpdf.1.gz
	dpkg-deb --build mkpdf_all


.PHONY man: mkpdf.1.gz
mkpdf.1.gz: docs.md
	pandoc -t man --standalone -o mkpdf.1 \
		-M title="mkpdf" -M section=1 docs.md
	gzip -f mkpdf.1
