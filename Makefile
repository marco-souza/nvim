all: pr-ready

install:
	echo "===> installing dependencies"
	sudo luarocks install luacheck

env:
	eval $(luarocks path --bin)

fmt:
	echo "===> Formatting"
	stylua lua/ --config-path=.stylua.toml
	echo "===> Linting"
	luacheck lua/

