class Agx < Formula
  version "1.22.48"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.48/agx-1.22.48-darwin-arm64.tar.gz"
      sha256 "464095d4cf08c281021d02752ff8254f6f71a3736a6eb6f9b2ddc1b4a9722e6b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.48/agx-1.22.48-darwin-x64.tar.gz"
      sha256 "97c4e7493a1b977b28d4e597949d3bda636f3e55cb629f9b604acf77bb7fbf9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.48/agx-1.22.48-linux-arm64.tar.gz"
      sha256 "5b8cab1847c7df478231dc6fb2a5ecbc1edcdd5bb48dbb6ae419ef8daad77c79"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.48/agx-1.22.48-linux-x64.tar.gz"
      sha256 "2a6274b678b6999902c4c4e41ea8e702a724a0cfe69767579bf60a5c1d12109a"
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
