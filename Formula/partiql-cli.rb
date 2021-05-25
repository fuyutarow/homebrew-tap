$version_linux = "v0.202105.12"
$sha_linux = "a797d0b47f6e1857642aa1d20ffdeb2bf486388482fb4c099dc3771bfb06d297"
$version_mac = "v0.202105.12"
$sha_mac = "7aba0a6f3542bd93b8d32cefa735a64d6647a5c703fa85b71cada86303c39706"
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
