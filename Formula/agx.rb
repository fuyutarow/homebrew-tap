class Agx < Formula
  version "1.22.50"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.50/agx-1.22.50-darwin-arm64.tar.gz"
      sha256 "3786e1f3205bfbe8e949b8c7baa2e3ab4964d4351fa20271a929c45b5b9f5963"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.50/agx-1.22.50-darwin-x64.tar.gz"
      sha256 "2c645d4b8d5b04fe74d5f3f531f22a8539fa115d59ba3db9b1a427b3d1206b12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.50/agx-1.22.50-linux-arm64.tar.gz"
      sha256 "63740a22014acf625fa8cfc0c00c020e2d5432adf9d8d499abfafaf180f18d8c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.50/agx-1.22.50-linux-x64.tar.gz"
      sha256 "253daaff94e6b79a832d96873cfebde38820bfba4b63ee4ad036138abafd2bf5"
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
