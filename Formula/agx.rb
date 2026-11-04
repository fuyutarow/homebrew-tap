class Agx < Formula
  version "1.22.93"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.93/agx-1.22.93-darwin-arm64.tar.gz"
      sha256 "eaa4aeb515c15d5e79cdbb10dc2d19005cfb077e229ea6ba70818ceeb2eafa10"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.93/agx-1.22.93-darwin-x64.tar.gz"
      sha256 "31e5681cd363141f83fc1b2b6db5d2bac4cc40b0752893ba480c11f985333b8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.93/agx-1.22.93-linux-arm64.tar.gz"
      sha256 "f5ddba429d8d8e9bdecd009257456238d282c5fb4df6d2d14027f14e6158d11c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.93/agx-1.22.93-linux-x64.tar.gz"
      sha256 "1086f2d65f36124235020930a520f0b248e3fc86118d36cc7358890d677718e5"
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
