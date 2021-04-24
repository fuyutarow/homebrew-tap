require_relative './relatives/version-make.linux'
require_relative './relatives/version-make.mac'


class VersionMake < Formula
  version ::mac_VERSION

  desc "CLI tool for managing SemVer"
  homepage "https://github.com/fuyutarow/version-make"
  head "https://github.com/fuyutarow/version-make.git"

  if OS.mac?
    sha256 ::mac_SHA
  elsif OS.linux?
    sha256 ::linux_SHA
  end

  def install
    bin.install => 'version-make'
  end

  test do
    system "#{bin}/version-make", '--version'
  end
end
