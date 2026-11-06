class Agx < Formula
  version "4.0.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v4.0.0/agx-4.0.0-darwin-arm64.tar.gz"
      sha256 "e28d6852a2d62db376a474a0e5bb64a5b177c7650a88a2956e4c55786ab1dda2"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v4.0.0/agx-4.0.0-darwin-x64.tar.gz"
      sha256 "d5eee4f5da1195c2aa5bc8162d33bce9372a8801b891c82dc30dfab9658eb4ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v4.0.0/agx-4.0.0-linux-arm64.tar.gz"
      sha256 "d5c2c2852917efe9aa2791e062610096dc8e54cf7da9fb63f98aec53eeb50a94"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v4.0.0/agx-4.0.0-linux-x64.tar.gz"
      sha256 "252a7477c2b74324e83b22c677b1259548d280e7843bd3b4121f276b03a605fa"
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
