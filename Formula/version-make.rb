# require_relative 'relatives/version-make.mac'
# require_relative 'relatives/version-make.linux'
require './config'
# require './relatives/version-make.mac'
# require_relative 'relaties/version-make.linux'


class VersionMake < Formula
  version ::VERSION_mac
  desc "A CLI tool for versioning"
  homepage "https://github.com/fuyutarow/version-make"
  head "https://github.com/fuyutarow/version-make.git"

  url "https://github.com/fuyutarow/version-make/releases/download/#{version}/version-make-#{version}-x86_64-mac.zip"
  sha256 ::SHA_mac

  # if OS.mac?
  #   url "https://github.com/fuyutarow/version-make/release/download/#{:version}/version-make-v#{:version}-x86_64-mac.zip"
  #   sha256 :mac_sha
  # elsif OS.linux?
  #   url "https://github.com/fuyutarow/version-make/release/download/#{:version}/version-make-v#{:version}-x86_64-linux.zip"
  #   sha256 :linux_sha
  # end

  def install
    bin.install 'version-make'
  end

  test do
    system "#{bin}/version-make", '--version'
  end
end
