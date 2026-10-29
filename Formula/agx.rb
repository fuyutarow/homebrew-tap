class Agx < Formula
  version "1.22.29"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.29/agx-1.22.29-darwin-arm64.tar.gz"
      sha256 "84ced42fc996d9b522b7286c649f892189045efb970a7f90c5481cdfe86dd06d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.29/agx-1.22.29-darwin-x64.tar.gz"
      sha256 "44fcc6e2514d4be7a3a2e74073158f0d1d3a124539b3301d781f160096c63eb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.29/agx-1.22.29-linux-arm64.tar.gz"
      sha256 "d78ec3568216cc10592df034e8e9d0e93ba09725bee88bb4133c8eac6ac5aa7d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.29/agx-1.22.29-linux-x64.tar.gz"
      sha256 "3c0d6fc7ed4aa528b77faffcd40c90024a968c8686441dd522a6cb6f55f99750"
    end
  end

  def install
    executables = Dir["*"].select { |path| File.file?(path) && File.executable?(path) }
    if executables.empty?
      executables = Dir["bin/*"].select { |path| File.file?(path) && File.executable?(path) }
    end
    raise "no executables found in archive" if executables.empty?

    bin.install executables.reject { |path| File.basename(path) == "xmsg" }
    bin.install_symlink "agx-msg" => "xmsg"
  end

  test do
    assert_equal "agx #{version}", shell_output("#{bin}/agx -V").strip
  end
end
