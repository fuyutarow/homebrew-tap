$version_linux = "v0.202104.16"
$sha_linux = "f14aeeb2711dc8349f5a080d4831219cdc8178f3821e38630ff5d6c6816acc4c"
$version_mac = "v0.202104.16"
$sha_mac = "8aeec13408917c2079bf0e3aa0918a1711be7b4f7708f48b493d2bafb5c9bd24"
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
