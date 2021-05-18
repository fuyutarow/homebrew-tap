$version_linux = "v0.202105.7"
$sha_linux = "718c1045beee459026d71eee069274ecff1b1ae6de3ce39e6ecd6d55fcb5df62"
$version_mac = "v0.202105.7"
$sha_mac = "eedb5994c7ffa938c9b095886c2446c280b07ad91f6c5658f4c48280e6374bc5"
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
