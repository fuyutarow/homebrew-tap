$version_linux = "v0.202105.8"
$sha_linux = "1d2decs"
VERSION_mac = "v0.202104.7"
SHA_mac = "8d53f1db00bdf696385a86565925c77a3a118fd362c6f601f0c2b201bd3253ae"
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
