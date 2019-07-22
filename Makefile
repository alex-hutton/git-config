BASHRC = ~/.bashrc
BASHRC_LINE = source $(shell pwd)/git-completion.bash
DEPENDENCIES = wget
EMAIL ?= mail@alexhutton.xyz

install:
	git config --global user.email "${EMAIL}"
	touch ~/.bashrc
	../check_dependencies.sh $(DEPENDENCIES)
	wget -nc \
		https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
	grep -q "$(BASHRC_LINE)" $(BASHRC) || \
		echo $(BASHRC_LINE) >> $(BASHRC)
	git config --global user.name "Alex Hutton"
	git config --global color.ui auto
	git config --global core.editor vim
	git config --global core.excludesfile $(shell pwd)/gitignore_global
	@printf "\nRemember:\n source ~/.bashrc\n"
