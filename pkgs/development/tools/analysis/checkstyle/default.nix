{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  version = "6.4";
  name = "checkstyle-${version}";

  src = fetchurl {
    url = "mirror://sourceforge/checkstyle/${version}/${name}-bin.tar.gz";
    sha256 = "0qk653i8973ygz630siava3fm54vxmahbw6rikdi9lzjlpvvn74f";
  };

  installPhase = ''
    mkdir -p $out/checkstyle
    cp -R * $out/checkstyle
  '';

  meta = with stdenv.lib; {
    description = "Checks Java source against a coding standard";
    longDescription = ''
      checkstyle is a development tool to help programmers write Java code that
      adheres to a coding standard. By default it supports the Sun Code
      Conventions, but is highly configurable.
    '';
    homepage = http://checkstyle.sourceforge.net/;
    license = licenses.lgpl21;
    maintainers = with maintainers; [ pSub ];
  };
}
