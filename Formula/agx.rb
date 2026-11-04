class Agx < Formula
  version "1.22.98"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.98/agx-1.22.98-darwin-arm64.tar.gz"
      sha256 "665d9108fc8beb70e51fa4204c52f55065be70a087728d3cb2ac1a2e6a971450"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.98/agx-1.22.98-darwin-x64.tar.gz"
      sha256 "4f1ac4f0fca5a6ba33a6f9ddf983a824d400164dd0b2f9a2e35f99234dec4386"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.98/agx-1.22.98-linux-arm64.tar.gz"
      sha256 "8d2b755bbf023eb207722ec041f0327821362c84ca41fd7ae1e6143a7f0d64f5"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.98/agx-1.22.98-linux-x64.tar.gz"
      sha256 "03238b92496d99aac6215a5c7d5365a9d70a3506c61048987ab1913dc1e66e12"
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
