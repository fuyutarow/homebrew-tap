$version_linux = "v0.202105.5"
$sha_linux = "574034d0ae5e91f8e497db5929d1d8dc86caf1f27576b52cf249c67fc8670068"
$version_mac = "v0.202105.5"
$sha_mac = "eb6344a49de0ad0e00b198c2ef3ef7a770a8c54d788a49a1d7a2738bec213d29"
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
