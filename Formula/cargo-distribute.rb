$version_linux = "v0.202105.9"
$sha_linux = "5ff7e77fb6140046343610ab106dc5a9be32299143b357ab83131226dd62f990"
$version_mac = "v0.202105.9"
$sha_mac = "6d622e32400efe97808ed011d5916c4f08d62e90bd4701ddb65f1121bc99f948"
$formula_name = "cargo-distribute"

class CargoDistribute < Formula
  version $version_mac
  desc "A CLI tool"
  homepage "https://github.com/fuyutarow/cargo-distribute"
  head "https://github.com/fuyutarow/cargo-distribute.git"

  if OS.mac?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_mac}/#{$formula_name}-#{$version_mac}-x86_64-mac.zip"
    sha256 $sha_mac
  elsif OS.linux?
    url "https://github.com/fuyutarow/#{$formula_name}/releases/download/#{$version_linux}/#{$formula_name}-#{$version_linux}-x86_64-linux.zip"
    sha256 $sha_linux
  end

  def install
    bin.install "cargo-distribute"
  end

  test do
    system "#{bin}/cargo-distribute", '--version'
  end
end
