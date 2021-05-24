$version_linux = "v0.202105.9"
$sha_linux = "8c8d6e7dfa2327d5115d5caadc9826d6f074fc0a22121dcb7a09416428d4ff92"
$version_mac = "v0.202105.9"
$sha_mac = "3cc2b48ca0dfac517bf47ccee2e183b45ccc69f66f996d2cbdb1023f523835cc"
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
