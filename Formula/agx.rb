class Agx < Formula
  version "1.22.66"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.66/agx-1.22.66-darwin-arm64.tar.gz"
      sha256 "60ffe5af4429772f169b67d294f1558548756c4e7f371548c2451c45b667724a"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.66/agx-1.22.66-darwin-x64.tar.gz"
      sha256 "6cec068169439245185e3397716e6622bbeaa082fad3492250ba3c168f68ebe2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.66/agx-1.22.66-linux-arm64.tar.gz"
      sha256 "70fdef30f9fea6dc621adc24fd4cc4821688167a7b19332a2b5a6490008a91b4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.66/agx-1.22.66-linux-x64.tar.gz"
      sha256 "d8998d1edeedc2bfe4692510a54a396f52700296ffb3a1d481e37e50b75d4882"
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
