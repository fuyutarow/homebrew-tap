$version_linux = "v0.202104.13"
$sha_linux = "319ac19f5a992606f67acec7bd531c0c14ee6e9f65b00bf03f4b0298de0e550a"
$version_mac = "v0.202104.13"
$sha_mac = "bdaeb00fdf19513cd44e1026454c91910c2daf8233469ef963207590728ba976"
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
