$version_linux = "v0.202106.2"
$sha_linux = "14221477527ce1ac21965f5fd18d26104ceecb7c8422d1439d97278f85fae2ad"
$version_mac = "v0.202106.2"
$sha_mac = "1461edf84871d97a91bc9cf3000a619d6b0da46d1cf512d51ad3a29567dabb4b"
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
