$version_linux = "v0.202104.14"
$sha_linux = "bdf38537fc02acb7dc9a5ae262351be8978f7ba2e15e1ffa476469cfb79a49d3"
$version_mac = "v0.202104.14"
$sha_mac = "fd994fd520e09bd4f886d45aa64f00064f4abf14ba45dbbf17489a9aa006cc38"
$formula_name = "version-make"

class VersionMake < Formula
  version $version_mac
  desc "A CLI tool for versioning"
  homepage "https://github.com/fuyutarow/version-make"
  head "https://github.com/fuyutarow/version-make.git"

  if OS.mac?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_mac}/#{$formula_name}-#{$version_mac}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_linux}/#{$formula_name}-#{$version_linux}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install 'version-make'
  end

  test do
    system "#{bin}/version-make", '--version'
  end
end
