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
