class Agx < Formula
  version "1.22.70"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.70/agx-1.22.70-darwin-arm64.tar.gz"
      sha256 "bbb38f0d238d27a08d4579cb88e498b45e8cc346e146a0f1dac3554d07826883"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.70/agx-1.22.70-darwin-x64.tar.gz"
      sha256 "705ed7ddf25fd78d84f085f9c558361adac131cbb822293a8064b561e8108521"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.70/agx-1.22.70-linux-arm64.tar.gz"
      sha256 "2208e06b417f4d18819a40127eb6736c5e4f0fc577646068373f4e8b61c04624"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.70/agx-1.22.70-linux-x64.tar.gz"
      sha256 "749a6eca8ecd291e0610cc4b4a9fbf15e4b06059029ab7a57bd67201e129658b"
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
