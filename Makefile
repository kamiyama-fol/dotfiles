DOTFILES_DIR := $(shell pwd)

MUST_INSTALL_MANYALLY = nvim 

ITEMS := .config .bash_profile .bashrc

help:
	@echo "helpです"
	@echo "使用可能なコマンド:"
	@echo "  make install  - シンボリックリンクを張り、環境を構築します"
	@echo "  make unlink   - 作成したシンボリックリンクを削除します"

install:
	# install dotfiles items
	@for item in $(ITEMS); do \
		if [ -e ~/$${item} ] && [ ! -L ~/$${item} ]; then \
			echo "Warning: ~/$${item} が既に存在するためバックアップします"; \
			mv ~/$${item} ~/$${item}.bak; \
		fi; \
		ln -fnsv $(DOTFILES_DIR)/$${item} ~/$${item};\
	done
	# install languages version managers
	@if [ -d ~/.pyenv ]; then \
		echo "pyenv already exists. Skipping clone."; \
	else \
		git clone git://github.com/pyenv/pyenv.git ~/.pyenv; \
	fi
	@if [ -d ~/.rbenv ]; then \
		echo "rbenv already exists. Skipping clone."; \
	else \
		git clone git://github.com/rbenv/rbenv.git ~/.rbenv; \
	fi
	@if [ -d ~/.nvm ]; then \
		echo "nvm already exists. Skipping clone."; \
	else \
		git clone https://github.com/nvm-sh/nvm.git ~/.nvm; \
	fi
	xcode-select --install
	# install homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"	
	@echo "完了しました。"
	@for soft in $(MUST_INSTALL_MANYALLY); do \
		@echo "You need to install $${item} manually."\
	done
	# sync default commit massage
	git config [--global] commit.template $(DOTFILES_DIR)/gitmessage.txt

unlink:
	@echo "リンクを解除します..."
	@for item in $(ITEMS); do \
		if [ -L "${HOME}/$${item}" ]; then \
			rm -v "${HOME}/$${item}"; \
		fi; \
	done
	
