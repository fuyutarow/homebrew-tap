class Agx < Formula
  version "1.21.3"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.3/agx-1.21.3-darwin-arm64.tar.gz"
      sha256 "79e484cdb52e7029a0cc67b6b77bb06e74a4d0176a186dce905031a16e83e620"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.3/agx-1.21.3-darwin-x64.tar.gz"
      sha256 "b07203c4616c23302c45e7e6b5ad3fb10d585a2074e6a19b6c9db56861ee5ab3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.3/agx-1.21.3-linux-arm64.tar.gz"
      sha256 "3ddf1bc14ce180cbf064664e19b282f84bef1bc5a31ce7bf91d7be9f241530e6"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.3/agx-1.21.3-linux-x64.tar.gz"
      sha256 "4773e4165e96a8b0c08cdd2aaf0681cb009ed62e7e92bb1e094c3d365018dd65"
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
