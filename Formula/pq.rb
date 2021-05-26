$version_linux = "v0.202105.15"
$sha_linux = "9699f0a4166f1858a5919c57f1af9d0958011f31f3e3790681757f1b20386841"
$version_mac = "v0.202105.15"
$sha_mac = "ce0237eb2ee21e8b2a08129f71ea04cf1952e1501aef01e4b8830003e6d997cc"
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
