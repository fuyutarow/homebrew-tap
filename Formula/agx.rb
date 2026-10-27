class Agx < Formula
  version "1.20.4"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.4/agx-1.20.4-darwin-arm64.tar.gz"
      sha256 "20238e370f45a1e9f29342b650cc8e0ed89a9317c5647285cc05fd290bee2d29"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.4/agx-1.20.4-darwin-x64.tar.gz"
      sha256 "ba27764637df28a6e7669df6b5806449649af8854c53b9f0b5292a6205ebe443"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.4/agx-1.20.4-linux-arm64.tar.gz"
      sha256 "dea31a019edf101360bc5a9fd650fedc8cbc44dee1dd48a64de6467c1bb2913f"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.4/agx-1.20.4-linux-x64.tar.gz"
      sha256 "053acbfd0a1b3bd7663f8ec84661047d95eacdb42c53d9e7dc0071b896f14364"
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
