BASHRC_LINE = source $(shell pwd)/git-completion.bash
DEBIAN_DEPENDENCIES = wget
PERSONA ?= self

install: install_${PERSONA}
	touch ~/.bashrc
	DEBIAN_FRONTEND=noninteractive sudo -E apt-get -y install $(DEBIAN_DEPENDENCIES)
	wget -nc \
		https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
	-grep -v "$(BASHRC_LINE)" ~/.bashrc > temp
	mv temp ~/.bashrc
	echo $(BASHRC_LINE) >> ~/.bashrc
	git config --global user.name "Alex Hutton"
	git config --global color.ui auto
	git config --global core.editor vim
	git config --global core.excludesfile $(shell pwd)/gitignore_global
	echo "\nRemember:\n source ~/.bashrc\n"

install_self:
	git config --global user.email "alex@jovialsol.com"

install_ix:
	git config --global user.email "ahutton@infoxchange.net.au"
