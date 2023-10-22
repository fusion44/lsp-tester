let
  pkgs = import <nixpkgs> {};
in
{ lib ? pkgs.lib
, buildGoModule ? pkgs.buildGoModule
, fetchgit ? pkgs.fetchgit
}:
buildGoModule rec {
  pname = "lsp-tester";
  version = "unstable-2023-10-22"; # Use the date of packaging as version
  
  src = fetchgit {
    url = "https://github.com/madkins23/lsp-tester.git";
    rev = "977a2b39ab602da3716b4bebdf9ac858f1101856";  # This should be the exact branch name
    sha256 = "sha256-YjEXteIi1iK81KUQRU/MJzzZ909l0vLsGTR468F7f90=";
  };

 vendorSha256 = "sha256-zu0R/H2xEtpxXMOUA2ky8+Y19DHnZsR6iCUlXaelKhI="; # This needs to be updated

  meta = with lib; {
    description = "LSP tester utility";
    homepage = "https://github.com/madkins23/lsp-tester";
    license = licenses.mit;
    maintainers = [ maintainers.fusion44 ];
  };
}

