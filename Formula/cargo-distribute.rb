$version_linux = "v0.202105.6"
$sha_linux = "a73939c964ebf4b030e2a78272b6b0a3cdd0e8fb39731055e0d95709e478c48f"
$version_mac = "v0.202105.6"
$sha_mac = "db7be9492d5b9a9383225cde3cc07a528e07da6b1914ec6c42eed11dc9cf1f4c"
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
