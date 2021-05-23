$version_linux = "v0.202105.8"
$sha_linux = "b04b75c93e6508f6545355c732f52932e59c9017ca89e270180ad71e7f7a1a7a"
$version_mac = "v0.202105.8"
$sha_mac = "8366ad90dd6773017e26f948c6856fdf33902cc3956fdf2ee592dbef4c1e47e2"
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
