class Agx < Formula
  version "1.21.4"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.4/agx-1.21.4-darwin-arm64.tar.gz"
      sha256 "a7a8fb1cd8300b01d9e5b8d4fc74797bf8291e13065e5b6ef1fceea965ce5ebf"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.4/agx-1.21.4-darwin-x64.tar.gz"
      sha256 "062f88633c0f366f2c7b137431d76546a5d6f87bd9d9282fc80fb42bbbd422eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.4/agx-1.21.4-linux-arm64.tar.gz"
      sha256 "66aed6e98e3516a51932401bfdf337dd28426424138dc0eee1f9a38b09e00cb0"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.4/agx-1.21.4-linux-x64.tar.gz"
      sha256 "6bee7eeff14b88db83b968128b2d9cf29dfa29b6a46202c7352e6758a27eefd2"
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
