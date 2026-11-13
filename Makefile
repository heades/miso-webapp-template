.PHONY= update build optim

WASM_SHELL = nix develop .\#wasm --command

CABAL_ARGS += --allow-newer=base,template-haskell --with-compiler=wasm32-wasi-ghc --with-hc-pkg=wasm32-wasi-ghc-pkg --with-hsc2hs=wasm32-wasi-hsc2hs --with-haddock=wasm32-wasi-haddock
RELEASE_CHANNEL := https://gitlab.haskell.org/haskell-wasm/ghc-wasm-meta/-/raw/master/ghcup-wasm-0.0.9.yaml
WASM_BOOTSTRAP := https://gitlab.haskell.org/haskell-wasm/ghc-wasm-meta/-/raw/master/bootstrap.sh

APPName := app

JS_DIR := "public/js"

all: update build optim

update:
	$(WASM_SHELL) wasm32-wasi-cabal update

build: 
	$(WASM_SHELL) zsh -c '\
		set -e; \
		wasm32-wasi-cabal $(CABAL_FLAGS) build; \
		rm -rf public; \
		cp -r static public; \
		my_wasm=$$(wasm32-wasi-cabal $(CABAL_FLAGS) list-bin ${APPName} | tail -n 1); \
		$$(wasm32-wasi-ghc --print-libdir)/post-link.mjs --input $$my_wasm --output $(JS_DIR)/ghc_wasm_jsffi.js; \
		cp -v $$my_wasm public/'	

optim:
	$(WASM_SHELL) zsh -c '\
		wasm-opt -all -O2 public/${APPName}.wasm -o public/${APPName}.wasm; \
		wasm-tools strip -o public/${APPName}.wasm public/${APPName}.wasm'

serve:
	$(WASM_SHELL) http-server public

css:	
	mkdir -p public/css/
	cp -v static/css/* public/css

clean:
	rm -rf dist-newstyle public


