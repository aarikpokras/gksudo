# Makefile
# 
# gksudo
# Have all be `warn`
# Should only be run after configure.sh is run.
#
all: warn man_install
warn:
	@echo Run `sudo make install` to install.
bash_install:
	mv gksudo.sh gksudo
	sudo cp gksudo /usr/local/bin/
	sudo chmod +x /usr/local/bin/gksudo
perl_install:
	mv gksudo.pl gksudo
	sudo cp gksudo /usr/local/bin/
	sudo chmod +x /usr/local/bin/gksudo
man_install:
	sudo cp gksudo.1 /usr/share/man/man1/

