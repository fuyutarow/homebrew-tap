$version_linux = "v0.202104.10"
$sha_linux = "5c270ed2d8f8adcf61e1faf12e69a098364b0fb0fc4b317f0ab3d8380dbf3788"
$version_mac = "v0.202104.10"
$sha_mac = "ea147bf2adf17ce8ad1518ff51171b45954c002a0fd3ce4256d203f738dc0eb5"
$formula_name = "snippets-make"

class SnippetsMake < Formula
  version $version_mac
  desc "A CLI tool for managing code snippets"
  homepage "https://github.com/fuyutarow/#{$formula_name}"
  head "https://github.com/fuyutarow/snippets-make.git"


  if OS.mac?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{version}/#{$formula_name}-#{version}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{version}/#{$formula_name}-#{version}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install 'snippets-make'
  end

  test do
    system "#{bin}/snippets-make", '--version'
  end
end