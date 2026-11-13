# Miso App Template

A minimal starting point for a [Miso](https://github.com/dmjio/miso) web app, compiled to WebAssembly with GHC's WASM backend.

## Requirements

- [Nix](https://nixos.org/) with flakes enabled. The dev shells come from Miso's flake.

## Quick start

```sh
make update   # update the cabal package index (first run only)
make build    # build the WASM app and assemble it into public/
make optim    # optional: shrink the .wasm with wasm-opt and wasm-tools
make serve    # serve public/ with http-server
```

`make` with no target runs `update`, `build` and `optim`. `make clean` removes `dist-newstyle/` and `public/`.

## Layout

```
client/Main.hs     WASM entry point: mounts the root component
src/client/        app library: Model, ViewModel (update logic), View
static/            index.html, JS loader, CSS and icons, copied to public/
test/client/       hspec + QuickCheck tests for the client library
server/Main.hs     native CLI entry point (app-cli)
```

## Tests

```sh
nix develop --command cabal test app-client-test
```

## Starting a new app

1. Copy this repo.
2. Rename the `app` package in `app.cabal`, and update `APPName` in the `Makefile` to match.
3. Replace the model, update logic and view in `src/client/`.

## License

BSD-3-Clause. See [LICENSE](LICENSE).
