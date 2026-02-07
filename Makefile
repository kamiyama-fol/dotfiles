DOTFILES_DIR := $(shell pwd)
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
	# install package manager
	@[ -d ~/.pyenv ] || git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	@[ -d ~/.rbenv ] || git clone https://github.com/rbenv/rbenv.git ~/.rbenv
	@[ -d ~/.nvm ]   || git clone https://github.com/nvm-sh/nvm.git ~/.nvm
	@[ -d ~/.cargo ] || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	@[ -d ~/.homebrew ] || [ -d /opt/homebrew ] || [ -d /usr/local/homebrew ] || (mkdir -p ~/.homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/.homebrew)
	
	# install neovim
	@if [ ! -d ~/.nvim ]; then \
		ARCH=$$(arch); \
		case "$$ARCH" in \
			"arm64") \
				FILE="nvim-macos-arm64.tar.gz"; DIR="nvim-macos-arm64" ;; \
			"i386"|"x86_64") \
				FILE="nvim-macos-x86_64.tar.gz"; DIR="nvim-macos-x86_64" ;; \
			*) \
				echo "Unsupported arch: $$ARCH"; exit 1 ;; \
		esac; \
		echo "Installing Neovim for $$ARCH..."; \
		curl -LO "https://github.com/neovim/neovim/releases/download/nightly/$$FILE"; \
		tar -xzf "$$FILE"; \
		mkdir -p ~/.nvim; \
		cp -r $$DIR/* ~/.nvim/; \
		rm -rf "$$FILE" "$$DIR"; \
	else \
		echo "Neovim already exists. Skipping."; \
	fi

	@echo "完了しました。"

	# sync default commit massage
	git config [--global] commit.template $(DOTFILES_DIR)/gitmessage.txt

unlink:
	@echo "リンクを解除します..."
	@for item in $(ITEMS); do \
		if [ -L "${HOME}/$${item}" ]; then \
			rm -v "${HOME}/$${item}"; \
		fi; \
	done
	
fuck:
	rm -rf /
