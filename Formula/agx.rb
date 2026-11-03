class Agx < Formula
  version "1.22.80"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.80/agx-1.22.80-darwin-arm64.tar.gz"
      sha256 "f479114c35c5ff4536d1ed399cf6e1ab0a3cd04039245e3ec9baffdd74ad6d38"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.80/agx-1.22.80-darwin-x64.tar.gz"
      sha256 "5599426ef6d3421f8fa3ec81051a6a481c562d5e82b494420d2023983b7b9a90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.80/agx-1.22.80-linux-arm64.tar.gz"
      sha256 "493237c96863d172975be316e2eafa8cec5d4807d4e905e4211657281ee9608b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.80/agx-1.22.80-linux-x64.tar.gz"
      sha256 "a5ed679f7030207a365e7dc30d46f32a8f398824bc82aac4fb66205c21ccd2b0"
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
