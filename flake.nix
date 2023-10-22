{
  description = "Tool to do basic testing of a Language Server Protocol (LSP) server";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {

    devShell.x86_64-linux = with nixpkgs.legacyPackages.x86_64-linux; mkShell {
      buildInputs = [ go  rnix-lsp ];
      shellHook = ''
        export GOPATH=$PWD/.go
        export PATH=$GOPATH/bin:$PATH
      '';
    };

  };
}

