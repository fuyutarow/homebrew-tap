$version = "v0.202104.11"
$sha_linux = "fc66d76a14838b008883afb211a763f4f686291e2043ac396203ad9b0133e0ca"
$sha_mac = ""
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
