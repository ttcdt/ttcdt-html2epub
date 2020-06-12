PROJ=ttcdt-html2epub
PREFIX=/usr/local/bin

all:
	@echo "Run make install to install."

install:
	install -m 755 $(PROJ) $(PREFIX)/$(PROJ)

uninstall:
	rm -f $(PREFIX)/$(PROJ)

test: carcosa.epub

carcosa.epub: carcosa.txt
	./ttcdt-html2epub -t "An Inhabitant of Carcosa" \
		-a "Ambrose Bierce" -l en carcosa.epub carcosa.txt

debug:
	./ttcdt-html2epub -t "An Inhabitant of Carcosa" \
		-a "Ambrose Bierce" -l en carcosa.epub carcosa.txt -I

dist: clean
	rm -f ttcdt-html2epub.tar.gz && cd .. && \
		tar czvf ttcdt-html2epub/ttcdt-html2epub.tar.gz ttcdt-html2epub/*

clean:
	rm -f carcosa.epub *.tar.gz *.asc

run:
	./ttcdt-html2epub || true
