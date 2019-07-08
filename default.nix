with import <nixpkgs> {};

let
    # stdenv comes with sed and tr
    script = pkgs.writeShellScriptBin "tldend" ''
        echo $@ | grep --color -E $(${pkgs.curl}/bin/curl --silent https://publicsuffix.org/list/public_suffix_list.dat | sed -E '/\/\/|^$|\./d' | tr '\n' '|' | sed 's/|/$&/g;s/.$//')
    '';
in stdenv.mkDerivation rec {
    name = "tldend";

    buildInputs = [ script ];
}