class Agx < Formula
  version "11.0.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.0.1/agx-11.0.1-darwin-arm64.tar.gz"
      sha256 "ae8806840f2aa66185a9138459c09879d2fe50b049f97a6fd34a6b2639ece7da"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.0.1/agx-11.0.1-darwin-x64.tar.gz"
      sha256 "019acb24b65e4f7ca64fda57ec618175b668c36224fba0f0b06efd37425cc2ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.0.1/agx-11.0.1-linux-arm64.tar.gz"
      sha256 "f09cd702d15bfb656997c8f2406747eb53fdcc59e8570bcd58a4701a6fc1a1a9"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.0.1/agx-11.0.1-linux-x64.tar.gz"
      sha256 "ca4ac1f16a220a295d4c4167cfc9f92d497806d9223bcdd8cedfdc686eae96ea"
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
