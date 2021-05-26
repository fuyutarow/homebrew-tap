$version_linux = "v0.202105.16"
$sha_linux = "a5d7ca85e304c489229c7f07b41347c2ec9146ebddf3cb3f1c00885867dadfc4"
$version_mac = "v0.202105.16"
$sha_mac = "6fc7c667413d656da82f3c027157f08d64f15ffb014c41eec3a334d44d7c6c2d"
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
