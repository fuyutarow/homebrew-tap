class Agx < Formula
  version "1.22.60"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.60/agx-1.22.60-darwin-arm64.tar.gz"
      sha256 "f429388819586fcc4282e0517a669c6893e8093f230dbab4a2492685a4ca5e60"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.60/agx-1.22.60-darwin-x64.tar.gz"
      sha256 "85c5638c3e3c9ecd0225f2ef0b266f059b652d0a9603b6dffbefcdcb40c70d12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.60/agx-1.22.60-linux-arm64.tar.gz"
      sha256 "853ebb27d079bd22674aac5503bace76f7fa39fe5057cedd21d3e01fb0ad2318"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.60/agx-1.22.60-linux-x64.tar.gz"
      sha256 "391e85c339cc8ddc499895fb2e6ae7a3cb4037d4cd28c3dcac4179adf240fed7"
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
