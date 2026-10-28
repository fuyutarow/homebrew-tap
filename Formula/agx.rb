class Agx < Formula
  version "1.22.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.1/agx-1.22.1-darwin-arm64.tar.gz"
      sha256 "0c3120cdc77676f344974d6e6f86fc94825aeb76260fb0f3259d79f33fffa8ae"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.1/agx-1.22.1-darwin-x64.tar.gz"
      sha256 "41bee23808b666056ae055035373a6bf8806dae6402077d3b2c4e944fb6f31a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.1/agx-1.22.1-linux-arm64.tar.gz"
      sha256 "2c011631e7bf7226f6ad1d078b27164a69715db58da4b5b871457ede2d577dc0"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.1/agx-1.22.1-linux-x64.tar.gz"
      sha256 "76b054eea8a3e628c68026b7ff084970b2cd6c6d937b44bb554aad5dba44224a"
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
