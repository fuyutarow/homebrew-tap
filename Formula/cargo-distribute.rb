$version_linux = "v0.202105.10"
$sha_linux = "cf0ceecb822c6da7a13c0735a56a11dec755d3f6e613de9f5df8199054ddbb8c"
$version_mac = "v0.202105.10"
$sha_mac = "6c588f247734a071befd9bcff034098f6626f7c7c881e340383b01a98adb3177"
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
