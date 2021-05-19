$version_linux = "v0.202105.7"
$sha_linux = "9b6693ded1f65cde357b4462978b97126cc477924fd5cbc5aa6de5f8333ac5cc"
$version_mac = "v0.202105.7"
$sha_mac = "c1192d8bc380a6fa9e00d2978a72ba0696535def328dfdc852013f880bbb182f"
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
