$version_linux = "v0.202106.9"
$sha_linux = "ada7641648f75048f17cac69ed6480155b826064639dab2473ee4d59a7442ee9"
$version_mac = "v0.202106.9"
$sha_mac = "7a53431d84df84c6e218fd36534d79d074aa3fe1d4e9294664588bc3dbd43a53"
$formula_name = "cargo-distribute"

class CargoDistribute < Formula
  version $version_mac
  desc "Template generator for continuous distribution of rust projects to homebrew, linuxbrew and scoop"
  homepage "https://github.com/fuyutarow/cargo-distribute"
  head "https://github.com/fuyutarow/cargo-distribute.git"

  if OS.mac?
    url "https://github.com/fuyutarow/cargo-distribute/releases/download/#{$version_mac}/#{$formula_name}-#{$version_mac}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/cargo-distribute/releases/download/#{$version_linux}/#{$formula_name}-#{$version_linux}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install "cargo-distribute"
  end

  test do
    system "#{bin}/cargo-distribute", '--version'
  end
end
