class Agx < Formula
  version "1.13.3"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.3/agx-1.13.3-darwin-arm64.tar.gz"
      sha256 "f87fff8f1b10dce2db0c61420d8ec1941b92a9ebd07496d6402ca1a81c40b07b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.3/agx-1.13.3-darwin-x64.tar.gz"
      sha256 "ee80a72c451ff1df3818cbfba3bc910dfa30ba402469e627489f732e4f7dcde8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.3/agx-1.13.3-linux-arm64.tar.gz"
      sha256 "abafd73373d284a8fe6c628cfebe90aa89b5af30fc1cd97ae5ede74179b6e351"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.3/agx-1.13.3-linux-x64.tar.gz"
      sha256 "8e6805d06b47d09d8f84b1c70d3f2b3b0827aa550d422a1a3d8352ebd8cfd819"
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
