class Agx < Formula
  version "1.22.43"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.43/agx-1.22.43-darwin-arm64.tar.gz"
      sha256 "bd5af1b9c2154fe853b6c8085060285f5aaadb8a50ddb5680ed89f73399a871b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.43/agx-1.22.43-darwin-x64.tar.gz"
      sha256 "96788d58a620a55a3d9ee163c56d93ff40371b06d8c1d8a48f3df955a7d1d628"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.43/agx-1.22.43-linux-arm64.tar.gz"
      sha256 "6decabc44d8f1538158d149b9e67485609d903a61d5b5ebc660dc2dab5c452b5"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.43/agx-1.22.43-linux-x64.tar.gz"
      sha256 "7374d98c08b3e37bc46809e9aa20ac9cb2d1ed6874d3f1ba10724bb25e3f6c0e"
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
