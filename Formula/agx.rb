class Agx < Formula
  version "1.20.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.2/agx-1.20.2-darwin-arm64.tar.gz"
      sha256 "abf289c6ade33fa325edfdaf0984a2988fdfe9d2ef7a168cfeb8dce2715200f4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.2/agx-1.20.2-darwin-x64.tar.gz"
      sha256 "ff34683e5fcf07ec6bbab07279aec958ec16c6e0b03e8f1367318dc4fde47b6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.2/agx-1.20.2-linux-arm64.tar.gz"
      sha256 "764644863955a37f5031e2ff8a88dbcdcfaac9f7ad73c2bc1178d653d90d766b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.2/agx-1.20.2-linux-x64.tar.gz"
      sha256 "3e98e4bde9699e094f7a8781946342b2cae21ada30c69aa12b0a1b8ab72d5863"
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
