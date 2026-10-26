class Agx < Formula
  version "1.16.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.16.1/agx-1.16.1-darwin-arm64.tar.gz"
      sha256 "ccab9c824a03e83b870af90a7d0df6acf3e8ba1b7465b7d359570c29f847c808"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.16.1/agx-1.16.1-darwin-x64.tar.gz"
      sha256 "19c919435345c5e4bb87ea09e169983ff3de388b26acc9895206b299566aaa40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.16.1/agx-1.16.1-linux-arm64.tar.gz"
      sha256 "a1b83b97b12d616f7c284452f03d8d63bf4c60a5bbb37e4b7c9424854b052e7d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.16.1/agx-1.16.1-linux-x64.tar.gz"
      sha256 "d27832bbe40d86f9cb593ab3d52fadc618bc43f6112a72cf786b0fec5b26c4e6"
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
