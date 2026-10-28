class Agx < Formula
  version "1.21.7"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.7/agx-1.21.7-darwin-arm64.tar.gz"
      sha256 "12d4eccd07f5cc5a26b8a9bc77a13899d1c3081cb9c939d5a0112ee39ae11326"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.7/agx-1.21.7-darwin-x64.tar.gz"
      sha256 "82fc2f211784ae0847cb5ab0e60b167c54f76f1dbb0020abefd31dcefda40cee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.7/agx-1.21.7-linux-arm64.tar.gz"
      sha256 "3fe69214f7046f37b5b262cb5c56cbd9ea2e757811d12bd3860bda9d87aa3272"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.7/agx-1.21.7-linux-x64.tar.gz"
      sha256 "4b4138c060f7cfb1f38de2cffa4a20938d8396ee5b4d112f745bcc75f77b77c1"
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
