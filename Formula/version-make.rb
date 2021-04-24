# require_relative './relatives/version-make'


class VersionMake < Formula
  # version ::VERSION

  desc "CLI tool for managing SemVer"
  homepage "https://github.com/fuyutarow/version-make"
  head "https://github.com/fuyutarow/version-make.git"

  if OS.mac?
    sha256 "dffb6ccb90395d2e9d90b3dc7f80736a30d6b5be42c99e99b6b3df87e965e30c"
  elsif OS.linux?
    sha256 "7f35438588860e8f372ce4b3dbed96abc848ec35cb4a7826df49f033d595277d"
  end

  def install
    bin.install Binary => 'shelp'
  end

  test do
    system "#{bin}/version-make", '--version'
  end
end
