$version_linux = "v0.202105.3"
$sha_linux = "0507892bc7142420305cf5fcabb82cc025715fe385887693b561dd9ad363a85d"
$version_mac = "v0.202105.3"
$sha_mac = "da1cc4e0f9886f7f2c1e7aa31cf477d5f7c379ab5867d84e9a5c9163c83f5b3b"
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
