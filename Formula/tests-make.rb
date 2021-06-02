$version_linux = "v0.202106.2"
$sha_linux = "c9ed9febfa10f2f2523cf1809847ace2a730fa8aa91df88a7eab817f4612a3ae"
$version_mac = "v0.202106.2"
$sha_mac = "4fd29f74917ef09969059f8aea9adefe8b5b9372eb7a114389ea94de2b2ab97b"
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
