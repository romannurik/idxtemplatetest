{ pkgs, language ? "js", ... }: {
  packages = [
    pkgs.nodejs
  ];
  bootstrap = ''
    mkdir -p "$WS_NAME"
    npm create -y vite@latest "$WS_NAME" -- --template ${if language == "ts" then "react-ts" else "react"}
    mkdir -p "$WS_NAME/.idx/"
    cp -rf ${./icon.png} "$WS_NAME/.idx/icon.png"
    cp -rf ${./dev.nix} "$WS_NAME/.idx/dev.nix"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
  '';
}