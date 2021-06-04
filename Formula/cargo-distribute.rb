$version_linux = "v0.202106.8"
$sha_linux = "586f25c629ea9b5834116b01c2c4cea8096c5a541d1d3ecfd76bbd961810be8c"
$version_mac = "v0.202106.8"
$sha_mac = "040d48e2066b7e6478d3038d1b9196357121e16505dcc9705d3d170d87112152"
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
