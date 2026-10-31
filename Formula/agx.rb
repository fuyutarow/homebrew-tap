class Agx < Formula
  version "1.22.52"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.52/agx-1.22.52-darwin-arm64.tar.gz"
      sha256 "bc7306ca4a46023b8be15271e8542a6b074c86ff17801adf85af9b25f4d65c15"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.52/agx-1.22.52-darwin-x64.tar.gz"
      sha256 "d6aca4575c42f36e44f2a76dec9a70aa12f090d9dd12bfa46ffabf3a6405434b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.52/agx-1.22.52-linux-arm64.tar.gz"
      sha256 "e327e8cd876d14c34e1eaa5c235b6e346bc70b01af71e971f6bd5ca383c285f1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.52/agx-1.22.52-linux-x64.tar.gz"
      sha256 "aef637ae3846c5ee872180fe41911087a236e2f6813cb9878a0ee77a55426ad7"
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
