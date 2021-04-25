$version_linux = "v0.202104.8"
$sha_linux = "1d2dec10702f292318f54aa603c19ae6cb83d1e8d6b928589ad950b4e829472a"
VERSION_mac = "v0.202104.7"
SHA_mac = "8d53f1db00bdf696385a86565925c77a3a118fd362c6f601f0c2b201bd3253ae"
$formula_name = "version-make"

class VersionMake < Formula
  version ::VERSION_mac
  desc "A CLI tool for versioning"
  homepage "https://github.com/fuyutarow/version-make"
  head "https://github.com/fuyutarow/version-make.git"


  if OS.mac?
    url "https://github.com/fuyutarow/version-make/releases/download/#{version}/version-make-#{version}-x86_64-mac.zip"
    sha256 ::SHA_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/version-make/releases/download/#{version}/version-make-#{version}-x86_64-linux.zip"
    sha256 ::SHA_linux
  end

  def install
    bin.install 'version-make'
  end

  test do
    system "#{bin}/version-make", '--version'
  end
end
