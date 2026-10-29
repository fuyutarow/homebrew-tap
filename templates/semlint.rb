class Semlint < Formula
  desc "Revision-based record checks and views for jj repositories"
  homepage "https://github.com/fuyutarow/semlint"
  version "@VERSION@"

  depends_on "git"
  depends_on "jj"

  on_macos do
    on_arm do
      # semlint-@VERSION@-darwin-arm64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v@VERSION@/semlint-@VERSION@-darwin-arm64.tar.gz"
      sha256 "@SHA_DARWIN_ARM64@"
    end

    on_intel do
      # semlint-@VERSION@-darwin-x64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v@VERSION@/semlint-@VERSION@-darwin-x64.tar.gz"
      sha256 "@SHA_DARWIN_X64@"
    end
  end

  on_linux do
    on_arm do
      # semlint-@VERSION@-linux-arm64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v@VERSION@/semlint-@VERSION@-linux-arm64.tar.gz"
      sha256 "@SHA_LINUX_ARM64@"
    end

    on_intel do
      # semlint-@VERSION@-linux-x64.tar.gz
      url "https://github.com/fuyutarow/semlint/releases/download/v@VERSION@/semlint-@VERSION@-linux-x64.tar.gz"
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
    assert_equal "semlint #{version}", shell_output("#{bin}/semlint --version").strip
  end
end
