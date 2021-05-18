$version_linux = "v0.202105.5"
$sha_linux = "ab276c0cca030328efc79412065cd8da77660615cf7867835810224140a5d2ef"
$version_mac = "v0.202105.5"
$sha_mac = "5a5cc36765400106bebfac5e3ddd02cc6a37c335e3da904a832dffa21b8c8008"
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
    bin.install "cargo-distribute"
  end

  test do
    system "#{bin}/cargo-distribute", '--version'
  end
end
