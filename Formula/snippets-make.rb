$version_mac = "v0.202104.7"
$sha_mac = "adc34831f12b3ebbd1989ef27087c09fc96d816ac47b67968fd9396711ba5e58"
$version_linux = "v0.202104.7"
$sha_linux = "adc34831f12b3ebbd1989ef27087c09fc96d816ac47b67968fd9396711ba5e58"
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
