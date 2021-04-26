$version_linux = "v0.202005.1"
$sha_linux = "8036dca4b2e7cea82d73e253a92d0827f10a34001e9e33b5860a0b0f3ec1db0c"
$version_mac = "v0.202005.1"
$sha_mac = "a3f2b7ca4aeb2fb8b266e52322d7f7513adcd2306baee02c6c9844c6fccfbc4d"
$formula_name = "version-make"

class VersionMake < Formula
  version $version_mac
  desc "A CLI tool for versioning"
  homepage "https://github.com/fuyutarow/version-make"
  head "https://github.com/fuyutarow/version-make.git"

  if OS.mac?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_mac}/#{$formula_name}-#{$version_mac}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_linux}/#{$formula_name}-#{$version_linux}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install 'version-make'
  end

  test do
    system "#{bin}/version-make", '--version'
  end
end
