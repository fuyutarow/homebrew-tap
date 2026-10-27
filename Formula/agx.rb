class Agx < Formula
  version "1.19.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.19.1/agx-1.19.1-darwin-arm64.tar.gz"
      sha256 "6636ac723c347e349b81dc6b117fbd92b2725622cb1460c84b0d665867fc2f5e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.19.1/agx-1.19.1-darwin-x64.tar.gz"
      sha256 "e877d137ddf4cc7e0085d55e476e4d0afa53328702353ac0cc2aacf71da112db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.19.1/agx-1.19.1-linux-arm64.tar.gz"
      sha256 "48ceb9e8f1af7025a72b53b4d2e37b8df89bac388accd794c061b0ce95227228"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.19.1/agx-1.19.1-linux-x64.tar.gz"
      sha256 "7bed9a0966dd254b367146a62e2d4961c78b3b2c9576de74396f2e3a82179dfc"
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
