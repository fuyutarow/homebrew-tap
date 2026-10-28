class Agx < Formula
  version "1.20.5"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.5/agx-1.20.5-darwin-arm64.tar.gz"
      sha256 "0c48d3572d81aa5a43e50433465a249853741ef2e117aaab8d2f29b8910d8595"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.5/agx-1.20.5-darwin-x64.tar.gz"
      sha256 "ca3ce8548f347b3b243cf944fa7ff04881d3f2b9695742f13cb3595788cddc71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.5/agx-1.20.5-linux-arm64.tar.gz"
      sha256 "68364296d300e760ee58985d4fb362e0f836783eac29c323dcc409647071347f"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.5/agx-1.20.5-linux-x64.tar.gz"
      sha256 "9b54d3a24157baee5170d546d2fa0b0936427591973fd503667cf72a504aa251"
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
