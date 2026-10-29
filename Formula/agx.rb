class Agx < Formula
  version "1.22.24"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.24/agx-1.22.24-darwin-arm64.tar.gz"
      sha256 "043abf54c8a574642396d4757e6a90e0f8f1ea734fe050e64f5b0bcb240e8c1a"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.24/agx-1.22.24-darwin-x64.tar.gz"
      sha256 "6e545a643d3f69414416fbc46c6075ea12450c39efc7a4c798d3b5f96c011351"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.24/agx-1.22.24-linux-arm64.tar.gz"
      sha256 "ab29c8b6a1fcaed050e0cae7d99f69d443d5f1d3d599b921c95db72a1da37cee"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.24/agx-1.22.24-linux-x64.tar.gz"
      sha256 "cd4a95c74fed67ef8ad94f8e14e8b805cb0b8c9d50efe18dcb55f100517720b0"
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
