$version_linux = "v0.202105.2"
$sha_linux = "71f4f0abc8e463fee6011a833282cc55197961048d332239291ddc5bf1a00f5e"
$version_mac = "v0.202105.2"
$sha_mac = "542791b8da37e6760b13d02d56ec4ef65cb823cc1a729ccdcc79418143dca233"
$formula_name = "partiql-cli"

class PartiqlCli < Formula
  version $version_mac
  desc ""
  homepage ""
  head ""

  if OS.mac?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_mac}/#{$formula_name}-#{$version_mac}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_linux}/#{$formula_name}-#{$version_linux}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install "partiql-cli"
  end

  test do
    system "#{bin}/partiql-cli", '--version'
  end
end
