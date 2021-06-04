$version_linux = "v0.202106.5"
$sha_linux = "d69e4de6601cbc825392174ac585acffa5d289de67515574f8620a7a9750eba2"
$version_mac = "v0.202106.5"
$sha_mac = "47fd911036cfd466018fb2798f47703610593cbb1cc3ba13f239834f555d65c0"
$formula_name = "cargo-distribute"

class CargoDistribute < Formula
  version $version_mac
  desc "A CLI tool"
  homepage "https://github.com/fuyutarow/cargo-distribute"
  head "https://github.com/fuyutarow/cargo-distribute.git"

  if OS.mac?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_mac}/#{$formula_name}-#{$version_mac}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_linux}/#{$formula_name}-#{$version_linux}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install "cargo-distribute"
  end

  test do
    system "#{bin}/cargo-distribute", '--version'
  end
end
