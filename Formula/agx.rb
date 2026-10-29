class Agx < Formula
  version "1.22.21"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.21/agx-1.22.21-darwin-arm64.tar.gz"
      sha256 "1a853d748a69d414f7fd0be9010e8f1b8255b787300065d78c03cc1676d4ea04"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.21/agx-1.22.21-darwin-x64.tar.gz"
      sha256 "eb83be91a81be031c50cbfa2fea3b5a8b593be32504dca701b10af49381677ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.21/agx-1.22.21-linux-arm64.tar.gz"
      sha256 "abb76910ab0707bb827b66ca8b424f40790a9c09611387bf27b2882bd40e0adb"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.21/agx-1.22.21-linux-x64.tar.gz"
      sha256 "bc0bff6f09212ee2b2d6fb8baa29f43e2e8774f37ba9feedff30b71c2c5aacb1"
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
