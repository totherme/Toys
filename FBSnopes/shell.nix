with import <nixpkgs> {};
let ffthingouter = rec {
        self = import ./FFAddon.nix { 
                inherit fetchurl fetchgit lib self; };
};
in let ffthing = ffthingouter.self ;
        in {
             addonDevEnv = stdenv.mkDerivation {
               name = "addon";
               buildInputs = [ stdenv nodejs npm2nix ffthing.by-version."jpm"."1.0.0" firefoxWrapper ];
             };
           }
