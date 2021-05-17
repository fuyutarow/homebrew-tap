$version_linux = "v0.202105.3"
$sha_linux = "b25cf6a10142bf327f89995051dca5cc78b933f9a6d59cf8fb301d5bd301ad94"
$version_mac = "v0.202105.3"
$sha_mac = "7d426d355cd34dee406261e9262174a09e6899b36ec08773516d5f62bd781aea"
$formula_name = cargo-distribute

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
    bin.install cargo-distribute
  end

  test do
    system "#{bin}/cargo-distribute", '--version'
  end
end
