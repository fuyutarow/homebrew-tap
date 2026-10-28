class Agx < Formula
  version "1.20.6"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.6/agx-1.20.6-darwin-arm64.tar.gz"
      sha256 "31cdc4e146bd66a72b1129db8a8729e86b2a1aeec910e58e1199cf2bf6f58a59"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.6/agx-1.20.6-darwin-x64.tar.gz"
      sha256 "880bedc5fd4029721c0ac3bf13129b7371cfa6ed6d7cc1c53047be0df25d9ac2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.6/agx-1.20.6-linux-arm64.tar.gz"
      sha256 "a1a0557b1367b05c4d91be52c39d4f8731a1dbadfc11a3035c53b9e3ce920908"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.6/agx-1.20.6-linux-x64.tar.gz"
      sha256 "af94edb83383ed356aea99661d4030f68b0c3326a7b66a5e906cae5fa5872428"
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
