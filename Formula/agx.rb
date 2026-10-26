class Agx < Formula
  version "1.13.13"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.13/agx-1.13.13-darwin-arm64.tar.gz"
      sha256 "b6a01c261b16be72cea3fc14081a5c58f387d670dfb799ad62d08055cf210ab7"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.13/agx-1.13.13-darwin-x64.tar.gz"
      sha256 "a58665860c47f92c50ed78fe2f7aa457a3e3e25e466d0989d4586dda39bc030a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.13/agx-1.13.13-linux-arm64.tar.gz"
      sha256 "2e16e130644628f2a508ac744f05a98ef9e4fa52a5d4f428bebb4bfcba113cdb"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.13/agx-1.13.13-linux-x64.tar.gz"
      sha256 "469e531a463a1b426f9e532f764867034bf88232e59e30e111a5f95fffc697b5"
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
