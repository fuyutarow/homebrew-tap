$version_linux = "v0.202105.0"
$sha_linux = "b2d07126b137eee6ba4d24acc7d8667ed7a604f8fa7127d981940fcaf5286972"
$version_mac = "v0.202105.0"
$sha_mac = "dffda139a625ccee2608a32c25fb4521b5c0dae367e021ad9c7cb69c49c18867"
$formula_name = "snippets-make"

class SnippetsMake < Formula
  version $version_mac
  desc "A CLI tool for managing code snippets"
  homepage "https://github.com/fuyutarow/#{$formula_name}"
  head "https://github.com/fuyutarow/snippets-make.git"

  if OS.mac?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_mac}/#{$formula_name}-#{$version_mac}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_linux}/#{$formula_name}-#{$version_linux}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install 'snippets-make'
  end

  test do
    system "#{bin}/snippets-make", '--version'
  end
end
