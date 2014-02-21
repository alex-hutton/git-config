BASHRC_LINE = source $(shell pwd)/git-completion.bash

install:
	touch ~/.bashrc
	wget -nc \
		https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
	-grep -v "$(BASHRC_LINE)" ~/.bashrc > temp
	mv temp ~/.bashrc
	echo $(BASHRC_LINE) >> ~/.bashrc
	git config --global user.name "Alex Hutton"
	git config --global user.email "alex@jovialsol.com"
	git config --global color.ui auto
	git config --global core.editor vim
	git config --global core.excludesfile $(shell pwd)/gitignore_global
	echo "source ~/.bashrc"

install_ix: install
	git config --global user.email "ahutton@infoxchange.net.au"
