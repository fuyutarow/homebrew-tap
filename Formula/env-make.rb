$version_linux = "v0.202105.6"
$sha_linux = "b5425f4a9bf3e9b236d14f952b6cb7fd4fb656bfc1edc86dbe2fc66faf6d960f"
$version_mac = "v0.202105.6"
$sha_mac = "ee820a5f632411a6fcba2c4deff3c036defbab338bbd100854ce1d6b362b7f71"
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
