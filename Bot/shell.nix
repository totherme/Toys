with import <nixpkgs> {}; 
let gdsec = eclipses.eclipse_sdk_44; in

{
        botEnv = stdenv.mkDerivation {
                name = "bot";
                buildInputs = [ stdenv openjdk gdsec commonsLang];
        };
}
