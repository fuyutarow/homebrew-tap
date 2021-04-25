require './versions/snippets-make/mac'
require './versions/snippets-make/linux'


class SnippetsMake < Formula
  version ::VERSION_mac
  desc "A CLI tool for managing code snippets"
  homepage "https://github.com/fuyutarow/snippets-make"
  head "https://github.com/fuyutarow/snippets-make.git"


  if OS.mac?
    url "https://github.com/fuyutarow/snippets-make/releases/download/#{version}/snipepts-make-#{version}-x86_64-mac.zip"
    sha256 ::SHA_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/snippets-make/releases/download/#{version}/snippets-make-#{version}-x86_64-linux.zip"
    sha256 ::SHA_linux
  end

  def install
    bin.install 'snippets-make'
  end

  test do
    system "#{bin}/snippets-make", '--version'
  end
end
