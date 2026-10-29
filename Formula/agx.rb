class Agx < Formula
  version "1.22.12"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.12/agx-1.22.12-darwin-arm64.tar.gz"
      sha256 "3bd5556f17b64a59677e44dced366540728f441ac79ee081852aff12fe7fdc36"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.12/agx-1.22.12-darwin-x64.tar.gz"
      sha256 "1fa66d26c3126aa66bc6640b507c34e3318cd6be6f577b04ea7a6bec907c3c31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.12/agx-1.22.12-linux-arm64.tar.gz"
      sha256 "529f08d251e23c6cc2eddb62dbe1af94172ba2b9cd92426ed2c9766f2edf47b6"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.12/agx-1.22.12-linux-x64.tar.gz"
      sha256 "14dc162de1c95b5d27fa0a1d327660ed5bce8a56251be9d6604814ee6e734160"
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
