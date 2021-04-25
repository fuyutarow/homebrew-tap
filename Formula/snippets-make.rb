$version_linux = "v0.202104.12"
$sha_linux = "e12cf89fc5fe7e4e9a7dd0380167359d4a25700cb0584d491e6f1ca0dd2e0bd6"
$version_mac = "v0.202104.13"
$sha_mac = "9eb7ddae5a12ee8cadd4ff8f2fb15bae745a9ea1b5bd1ee78d4c2eb0d851c841"
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
