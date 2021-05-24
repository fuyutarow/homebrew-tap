$version_linux = "v0.202105.11"
$sha_linux = "38a699397f6ca19915b3e490b7f38b1efa33b03fbf8da76638c953a8e21faaec"
$version_mac = "v0.202105.11"
$sha_mac = "5e95ee4a99affee8867a81e79264a466f0b2c0a02bac2823d42ea269ee1a8bb4"
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
