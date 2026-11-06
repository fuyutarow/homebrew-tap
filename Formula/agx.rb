class Agx < Formula
  version "1.23.4"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.4/agx-1.23.4-darwin-arm64.tar.gz"
      sha256 "03e11c9a062c3f0276f096d6462c6ffd5d3ce333705c77bd75114fd45b6b64af"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.4/agx-1.23.4-darwin-x64.tar.gz"
      sha256 "2bd50f1a3a2d2fabd7d970c8b4662ad08f0281d9ba3a18c1dcfa03ce1f62ae04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.4/agx-1.23.4-linux-arm64.tar.gz"
      sha256 "eab4a8a1ad9d20565652fa19ea3199811f81c796ec07b38ec6f57f26ac35a2a8"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.4/agx-1.23.4-linux-x64.tar.gz"
      sha256 "16c8951385dad942dcf3dea9f408a147fc9a3dafcd5442c834d4da0751138f3c"
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
