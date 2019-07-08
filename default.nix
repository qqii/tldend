with import <nixpkgs> {};

let
    # stdenv comes with sed tr grep
    tldend = pkgs.writeShellScriptBin "tldend" ''
        grep --color -E $(${pkgs.curl}/bin/curl --silent https://publicsuffix.org/list/public_suffix_list.dat | sed -E '/\/\/|^$|\./d' | tr '\n' '|' | sed 's/|/$&/g;s/.$//')
    '';
in stdenv.mkDerivation rec {
    name = "tldend";

    buildInputs = [ tldend ];
}