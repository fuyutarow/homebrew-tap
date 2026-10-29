class Agx < Formula
  version "1.22.27"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.27/agx-1.22.27-darwin-arm64.tar.gz"
      sha256 "472a5d7374962bd3fc534da3f3fcd3f009cf8cf33eda386e713401ceee557ca2"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.27/agx-1.22.27-darwin-x64.tar.gz"
      sha256 "652a6d73948cbe65186437ab532f987c85d9ae53b9727b4fff4a4df2dfff2201"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.27/agx-1.22.27-linux-arm64.tar.gz"
      sha256 "06b693b0838bb1ae384910e7de855b27b92b0365b43496ead6260c02f46ec4f9"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.27/agx-1.22.27-linux-x64.tar.gz"
      sha256 "5ddaa8e611e3d0d2b3fb7cf118a7dff8217a3e72f4a0492c92f98a7fa6254c3a"
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
