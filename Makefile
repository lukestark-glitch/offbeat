# Offbeat – alle vier Plugins auf einmal (jedes Plugin ist ein Submodule mit eigenem Makefile).
#   make          alle bauen
#   make check    alle Klang-Prüfungen
#   make install  macOS: alle installieren
#   make update   Submodules auf den neuesten Stand der Plugin-Repos
#   make clean    alle Build-Ergebnisse löschen

PLUGINS = engine topline turbo hydraulics

all check install clean:
	@for p in $(PLUGINS); do echo "== $$p: make $@"; $(MAKE) -C $$p $(subst all,,$@) || exit 1; done

update:
	git submodule update --init --remote
	git submodule foreach git submodule update --init --recursive

.PHONY: all check install clean update
