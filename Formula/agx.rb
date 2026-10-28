class Agx < Formula
  version "1.21.6"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.6/agx-1.21.6-darwin-arm64.tar.gz"
      sha256 "b8476eb289e16a1e220e00a0ecf8aac51d65e839e94528de5e15d751e34794b7"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.6/agx-1.21.6-darwin-x64.tar.gz"
      sha256 "b15eb1426c4311f5608d84ddd49749cd8187a3dc1604388dc7824fb73ac8302c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.6/agx-1.21.6-linux-arm64.tar.gz"
      sha256 "8d4cc1c6c082588c353112855111babc7bac4c52f22eb53de0ca17e99e2d9791"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.6/agx-1.21.6-linux-x64.tar.gz"
      sha256 "c4e19b3f9541dfdcb10c53956366d67a4748488fc2e9ad422f60fb3f350e544f"
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
