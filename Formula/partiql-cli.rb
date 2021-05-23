$version_linux = "v0.202105.7"
$sha_linux = "8741b57208dd9a45bc1f71ab8e65838ba15cdf7e6e774b8ef22c6aa0cd281077"
$version_mac = "v0.202105.7"
$sha_mac = "683ce76136cd14f7cd4aeca6f86c53cb31af79fc6703bb008c3397f8ba64ec19"
$formula_name = "partiql-cli"

class PartiqlCli < Formula
  version $version_mac
  desc ""
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
    bin.install "partiql-cli"
  end

  test do
    system "#{bin}/partiql-cli", '--version'
  end
end
