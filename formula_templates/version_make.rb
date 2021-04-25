
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
