$version_linux = "v0.202106.2"
$sha_linux = "a9ec88723cd7cf1f50c0d64e925348e67146200722372f1792e950c855133c23"
$version_mac = "v0.202106.2"
$sha_mac = "440504bc79931b13acf1534367f90b11c48ec69b42cba667e4405dbc333b8c32"
$formula_name = "env-make"

class EnvMake < Formula
  version $version_mac
  desc "A CLI tool for portable alias across shells and OS"
  homepage "https://github.com/fuyutarow/env-make"
  head "https://github.com/fuyutarow/env-make.git"

  if OS.mac?
    url "https://github.com/fuyutarow/env-make/releases/download/#{$version_mac}/#{$formula_name}-#{$version_mac}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/env-make/releases/download/#{$version_linux}/#{$formula_name}-#{$version_linux}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install "env-make"
  end

  test do
    system "#{bin}/env-make", '--version'
  end
end
