$version_linux = "v0.202106.11"
$sha_linux = "3e1323da09f88669f985918b34b1e4a63435db437ea40d28660abe76f60b2cf9"
$version_mac = "v0.202106.11"
$sha_mac = "44353ff5825561303e5db5200ea26bf99f9183fccc78222652edd994791989f0"
$formula_name = "cargo-distribute"

class CargoDistribute < Formula
  version $version_mac
  desc "Template generator for continuous distribution of rust projects to homebrew, linuxbrew and scoop"
  homepage "https://github.com/fuyutarow/cargo-distribute"
  head "https://github.com/fuyutarow/cargo-distribute.git"

  if OS.mac?
    url "https://github.com/fuyutarow/cargo-distribute/releases/download/#{$version_mac}/#{$formula_name}-#{$version_mac}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/cargo-distribute/releases/download/#{$version_linux}/#{$formula_name}-#{$version_linux}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install "cargo-distribute"
  end

  test do
    system "#{bin}/cargo-distribute", '--version'
  end
end
