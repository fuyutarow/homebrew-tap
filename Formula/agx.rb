class Agx < Formula
  version "1.20.7"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.7/agx-1.20.7-darwin-arm64.tar.gz"
      sha256 "7a10ff5174bdbec780a9622b70335125546ca00da53d7efb5b200ca28f00c6a0"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.7/agx-1.20.7-darwin-x64.tar.gz"
      sha256 "c2d09c908306d3bb611878029dd3836d49e8ef526c4731eb4fe4d06a5308d442"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.7/agx-1.20.7-linux-arm64.tar.gz"
      sha256 "a114aaf593e2c2e50385a2be0cb7ea3f8bee62bd4f1326326990f01d09af33ba"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.7/agx-1.20.7-linux-x64.tar.gz"
      sha256 "34d3f7a8ce3e2cdf2be0f0d2018800f61e6d558d66445cca1232f3a95003653a"
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
