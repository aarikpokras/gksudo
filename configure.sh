#!/bin/bash
printf "Checking for sudo..."; if [ $(hash sudo >& /dev/null; echo $?) -eq 0 ]; then echo yes; else printf "\e[1;31mno\e[0m\n"; fi
printf "Checking for zenity..."; if [ $(hash zenity >& /dev/null; echo $?) -eq 0 ]; then echo yes; else printf "\e[1;31mno\e[0m\n"; fi
printf "Checking for bash..."; if [ $(hash bash >& /dev/null; echo $?) -eq 0 ]; then echo yes; else printf "\e[1;31mno\e[0m\n"; fi
printf "Checking for make..."; if [ $(hash make >& /dev/null; echo $?) -eq 0 ]; then echo yes; else printf "\e[1;31mno\e[0m\n"; fi
printf "Checking for perl..."; if [ $(hash perl >& /dev/null; echo $?) -eq 0 ]; then echo yes; else printf "\e[1;31mno\e[0m\n"; fi
printf "Creating Makefile..."
if [ "$(cat Makefile | head -n7 | tail -n1)" =~ /all/ ]; then echo no need
else
echo -e \
"all: warn man_install\n"\
"warn:\n"\
"	@echo Run \`sudo make install\` to install.\n"\
"bash_install:\n"\
"	mv gksudo.sh gksudo\n"\
"	sudo cp gksudo /usr/local/bin/\n"\
"	sudo chmod +x /usr/local/bin/gksudo\n"\
"perl_install:\n"\
"	mv gksudo.pl gksudo\n"\
"	sudo cp gksudo /usr/local/bin/\n"\
"	sudo chmod +x /usr/local/bin/gksudo\n"\
"man_install:\n"\
"	sudo cp gksudo.1 /usr/share/man/man1/\n" >> Makefile
echo done
fi
echo Please install any missing packages from above.
echo Please run \`make\` then \`sudo make bash_install\` or \`sudo make perl_install\` to install.
