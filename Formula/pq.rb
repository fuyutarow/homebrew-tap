$version_linux = "v0.202105.12"
$sha_linux = "d7d82fb85288ec7d00bca689cbe928f21d44a28af40ddb94bb7c6cb6d2a68522"
$version_mac = "v0.202105.12"
$sha_mac = "f82e3091e681eceab8b2c357fde2d46ff8d5d125ba62cb54b94e8bebfef6a8bc"
$formula_name = "pq"

class Pq < Formula
  version $version_mac
  desc "A implementation of PartiQL"
  homepage "https://github.com/fuyutarow/partiql-rs"
  head "https://github.com/fuyutarow/partiql-rs.git"

  if OS.mac?
    url "https://github.com/fuyutarow/partiql-rs/releases/download/#{$version_mac}/#{$formula_name}-#{$version_mac}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/partiql-rs/releases/download/#{$version_linux}/#{$formula_name}-#{$version_linux}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install "pq"
  end

  test do
    system "#{bin}/pq", '--version'
  end
end
