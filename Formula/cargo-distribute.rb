$version_linux = "v0.202106.16"
$sha_linux = "40f1a11c1944442d83219b02bf33e32609162bbae43f3cc3048b818ecd87a182"
$version_mac = "v0.202106.16"
$sha_mac = "8d98fd523ca45f98dbb7266a489353140539f118a4d2828e50a6a12b1ca9bc32"
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
