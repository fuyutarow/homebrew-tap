class Agx < Formula
  version "8.0.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v8.0.0/agx-8.0.0-darwin-arm64.tar.gz"
      sha256 "fc9f742c7c5c1a02dee896cddb78ae176098ae0f3b19adf913045593bc23108b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v8.0.0/agx-8.0.0-darwin-x64.tar.gz"
      sha256 "98bff04c13014537f851495fdf1dc3939ebd49f124cc58b5fa4be317c62f4d60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v8.0.0/agx-8.0.0-linux-arm64.tar.gz"
      sha256 "50d7caeccc6fa1091bca9819aab50a9f56bf12167b1a8a3e3123bac197839598"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v8.0.0/agx-8.0.0-linux-x64.tar.gz"
      sha256 "8f86279226564d7c1e84af1c13934853303592e00fac2a1794423e74d724ccac"
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
