$version_linux = "v0.202105.9"
$sha_linux = "3c937fce876f482bc7b9fafb900b68d6c069aad10c743078eea91f097dcea273"
$version_mac = "v0.202105.9"
$sha_mac = "6c2327f3eda56628dc2a0f26cc7ec465ab4b8a95b269065cb5f3aa1539e690d6"
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
