
include config.mk

bin/st: objects/x.o objects/st.o
	$(CC) objects/st.o objects/x.o $(STLDFLAGS) -o $@

objects/x.o: sources/x.c headers/st.h headers/win.h headers/arg.h headers/config.h
	$(CC) $(STCFLAGS) -c sources/x.c -o $@

objects/st.o: sources/st.c headers/st.h headers/win.h headers/config.h
	$(CC) $(STCFLAGS) -c sources/st.c -o $@

clean:
	rm -f objects/* bin/st

install: bin/st
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f bin/st $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/st
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < misc/st.1 > $(DESTDIR)$(MANPREFIX)/man1/st.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/st.1
	tic -sx misc/st.info
	@echo Please see the README file regarding the terminfo entry of st.

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/st
	rm -f $(DESTDIR)$(MANPREFIX)/man1/st.1

run:
	bin/st
