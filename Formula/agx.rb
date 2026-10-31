class Agx < Formula
  version "1.22.57"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.57/agx-1.22.57-darwin-arm64.tar.gz"
      sha256 "d62dd11613e55af789be75bf37b0accca7154eaf81118f9a0b62d9465ad8178e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.57/agx-1.22.57-darwin-x64.tar.gz"
      sha256 "3a25f2b6b98bc575120fe8a7c75627772431e8c9f7fab580a71f29c8e835a567"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.57/agx-1.22.57-linux-arm64.tar.gz"
      sha256 "c5363f60758bdcd11c6738a66e03d2f68bf06806e899b3e6b47b1a396b699f9a"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.57/agx-1.22.57-linux-x64.tar.gz"
      sha256 "f5ec6eb3204a796273e97b04e872811498f642ee6d914b6622df3c3a37676147"
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
