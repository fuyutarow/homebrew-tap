class Agx < Formula
  version "1.22.40"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.40/agx-1.22.40-darwin-arm64.tar.gz"
      sha256 "0daaac2f5140051790e10ab622ceb05630e439791b8ebfab49a7f600306c5aa5"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.40/agx-1.22.40-darwin-x64.tar.gz"
      sha256 "d0a776dd2dc36f76ad21d5e5760412f1410a0d7a2034f9d0e051b716715ab57e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.40/agx-1.22.40-linux-arm64.tar.gz"
      sha256 "f3f6878a65fcd4e80bb52f7d6d42c6bb8c57f58e126de62adf6217999f5a702b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.40/agx-1.22.40-linux-x64.tar.gz"
      sha256 "de0c4b6112f0443c053435b3dacb8986bd441e2ec67a9cf6bbac920097004cf6"
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
