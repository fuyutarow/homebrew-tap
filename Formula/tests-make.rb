$version_linux = "v0.202106.3"
$sha_linux = "d13ef6e431bf4900eab80eeff7033aee6b33ff8bd9bba7d188d083510e968b8c"
$version_mac = "v0.202106.3"
$sha_mac = "62ce206d6d8b62e8b68dbbecd7652e0234599eb3feb6a62bbf0488ef72ffb250"
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
