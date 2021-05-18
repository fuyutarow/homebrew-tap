$version_linux = "v0.202105.3"
$sha_linux = "7e2a2cff35d5c2ac600fc59ef112f8094aff11e964a67433eff3b1b4b36f5ded"
$version_mac = "v0.202105.3"
$sha_mac = "7faa2006eb6fb2d68bcf19699635803e22501abfd87d8045de46cc5db2a74a52"
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
