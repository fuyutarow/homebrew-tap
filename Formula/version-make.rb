$version_linux = "v0.202104.8"
$sha_linux = "1d2dec10702f292318f54aa603c19ae6cb83d1e8d6b928589ad950b4e829472a"
$formula_name = "version-make"

class VersionMake < Formula
  version ::$version_linux
  desc "A CLI tool for versioning"
  homepage "https://github.com/fuyutarow/version-make"
  head "https://github.com/fuyutarow/version-make.git"


  if OS.mac?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{version}/#{$formula_name}-#{version}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{version}/#{$formula_name}-#{version}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install 'version-make'
  end

  test do
    system "#{bin}/version-make", '--version'
  end
end
