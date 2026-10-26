class Agx < Formula
  version "1.13.8"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.8/agx-1.13.8-darwin-arm64.tar.gz"
      sha256 "2505ed60017e7ad82b5b78c0fcd32ae5fb9aebdc61744a08fb2b3b4ad91666e2"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.8/agx-1.13.8-darwin-x64.tar.gz"
      sha256 "ffb99d833c3a8459f8c980c2798e4ed1a6b0506431236d7fb29621e4227fce56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.8/agx-1.13.8-linux-arm64.tar.gz"
      sha256 "93b19e9157a0691601d7748d758f5a671f2518d7b838036369c836ee64f341fb"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.8/agx-1.13.8-linux-x64.tar.gz"
      sha256 "8dd4ad2c6666608f40356dbbe0c2397b7d69923f33385af4e794f14d9f474ab0"
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
