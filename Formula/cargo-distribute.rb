$version_linux = "v0.202105.8"
$sha_linux = "6692161ad50d8cb0ee5a76aa71547f73736d0bb9bacb4f62969bb224c3981fae"
$version_mac = "v0.202105.8"
$sha_mac = "5f4e7e00cabf55b9bfe33b6c0fed286df9db84da0c622e0b3d277b4de9dcee3a"
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
