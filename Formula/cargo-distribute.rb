$version_linux = "v0.202106.15"
$sha_linux = "76598ed0729c0a78292ab23fc41199b7920a15911342486605f88d53d17655fd"
$version_mac = "v0.202106.15"
$sha_mac = "7a886245f3387cce8cee1b6c088d1171daa7999748843d6f8dcd0222c2c96ed3"
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
