$version_linux = "v0.202106.4"
$sha_linux = "b3b6f55e64be00a7ca0005b3d8c46e693047fcf756d8866ca57da05df88b059f"
$version_mac = "v0.202106.4"
$sha_mac = "f7a498b3d43eb2ce4f2d5903661145b89f5a5b7d2c18fd83faa97eb3e2e757de"
$formula_name = "tests-make"

class TestsMake < Formula
  version $version_mac
  desc "Write and run tests in TOML"
  homepage "https://github.com/fuyutarow/tests-make"
  head "https://github.com/fuyutarow/tests-make"

  if OS.mac?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_mac}/#{$formula_name}-#{$version_mac}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_linux}/#{$formula_name}-#{$version_linux}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install "tests-make"
  end

  test do
    system "#{bin}/tests-make", '--version'
  end
end
