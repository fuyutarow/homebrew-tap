$version_linux = "v0.202105.8"
$sha_linux = "8a7605e9e8339d0320531fbc6b5cf50dbd6384d2115a051ae017f930861ffb9b"
$version_mac = "v0.202105.8"
$sha_mac = "944218b61c287cb823a9845ea11a37915a5771c2c8de4fbfc65d2dadbd8b055a"
$formula_name = "env-make"

class EnvMake < Formula
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
    bin.install "env-make"
  end

  test do
    system "#{bin}/env-make", '--version'
  end
end
