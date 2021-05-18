$version_linux = "v0.202105.4"
$sha_linux = "bc35c578f723b714c2595cac4ac05d02f24a5b6dcff18f0726008aa7dfbd3903"
$version_mac = "v0.202105.4"
$sha_mac = "842a348e97457c506eef8568bbe3e96099d8b2b1c6564a4fe942ad08e4475543"
$formula_name = cargo-distribute

class CargoDistribute < Formula
  version $version_mac
  desc "A CLI tool"
  homepage "https://github.com/fuyutarow/cargo-distribute"
  head "https://github.com/fuyutarow/cargo-distribute.git"

  if OS.mac?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_mac}/#{$formula_name}-#{$version_mac}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_linux}/#{$formula_name}-#{$version_linux}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install cargo-distribute
  end

  test do
    system "#{bin}/cargo-distribute", '--version'
  end
end
