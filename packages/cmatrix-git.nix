{ stdenv, cmake, ncurses, cmatrix-src }:

stdenv.mkDerivation {
  pname = "cmatrix-git";
  version = "git";

  src = cmatrix-src;

  nativeBuildInputs = [ cmake ];
  buildInputs = [ ncurses ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_PREFIX=$out"
  ];
}
