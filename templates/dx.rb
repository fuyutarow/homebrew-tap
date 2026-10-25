class Dx < Formula
  version "@VERSION@"
  desc "Developer experience command line tool"
  homepage "https://github.com/fuyutarow/dx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/dx/releases/download/v@VERSION@/dx-@VERSION@-darwin-arm64.tar.gz"
      sha256 "@SHA_DARWIN_ARM64@"
    end
    on_intel do
      url "https://github.com/fuyutarow/dx/releases/download/v@VERSION@/dx-@VERSION@-darwin-x64.tar.gz"
      sha256 "@SHA_DARWIN_X64@"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/dx/releases/download/v@VERSION@/dx-@VERSION@-linux-arm64.tar.gz"
      sha256 "@SHA_LINUX_ARM64@"
    end
    on_intel do
      url "https://github.com/fuyutarow/dx/releases/download/v@VERSION@/dx-@VERSION@-linux-x64.tar.gz"
      sha256 "@SHA_LINUX_X64@"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dx --version")
  end
end
