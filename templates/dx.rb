class Dx < Formula
  desc "Revision-based record checks and views for jj repositories"
  homepage "https://github.com/fuyutarow/dx"
  version "@VERSION@"

  depends_on "git"
  depends_on "jj"

  on_macos do
    on_arm do
      # dx-@VERSION@-darwin-arm64.tar.gz
      url "https://github.com/fuyutarow/dx/releases/download/v@VERSION@/dx-@VERSION@-darwin-arm64.tar.gz"
      sha256 "@SHA_DARWIN_ARM64@"
    end

    on_intel do
      # dx-@VERSION@-darwin-x64.tar.gz
      url "https://github.com/fuyutarow/dx/releases/download/v@VERSION@/dx-@VERSION@-darwin-x64.tar.gz"
      sha256 "@SHA_DARWIN_X64@"
    end
  end

  on_linux do
    on_arm do
      # dx-@VERSION@-linux-arm64.tar.gz
      url "https://github.com/fuyutarow/dx/releases/download/v@VERSION@/dx-@VERSION@-linux-arm64.tar.gz"
      sha256 "@SHA_LINUX_ARM64@"
    end

    on_intel do
      # dx-@VERSION@-linux-x64.tar.gz
      url "https://github.com/fuyutarow/dx/releases/download/v@VERSION@/dx-@VERSION@-linux-x64.tar.gz"
      sha256 "@SHA_LINUX_X64@"
    end
  end

  def install
    executables = Dir["*"].select { |path| File.file?(path) && File.executable?(path) }
    if executables.empty?
      executables = Dir["bin/*"].select { |path| File.file?(path) && File.executable?(path) }
    end
    raise "no executables found in archive" if executables.empty?

    bin.install executables
  end

  test do
    assert_equal "dx #{version}", shell_output("#{bin}/dx --version").strip
  end
end
