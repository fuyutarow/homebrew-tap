$version_linux = "v0.202106.1"
$sha_linux = "301c438d33857ce4dead079f5a019fbaa1e76f1f6d861b9e6052953e7301590e"
$version_mac = "v0.202106.1"
$sha_mac = "4971e71cf9dcf7771b681b90fd3f9b81ac749f539e11538df6e5315540088c98"
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
