class Agx < Formula
  version "1.22.3"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.3/agx-1.22.3-darwin-arm64.tar.gz"
      sha256 "064cc28387258bfbb8271cc3b412814e1d394c9f614101cb14b51f4ad5d84e3c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.3/agx-1.22.3-darwin-x64.tar.gz"
      sha256 "ef371a78bb49ccec5568bf2368174fbb831008f67a93aef66ffbea74db28d49f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.3/agx-1.22.3-linux-arm64.tar.gz"
      sha256 "a96961628024f6d299c31e98511e43710cb8b5e295c86e84e3d8cf5fecb4f071"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.3/agx-1.22.3-linux-x64.tar.gz"
      sha256 "d626482f556486a002dfde7d515cc879311f3e0b4b69fbcf589def14a342583d"
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
