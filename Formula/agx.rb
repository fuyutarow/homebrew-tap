class Agx < Formula
  version "10.2.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.2.2/agx-10.2.2-darwin-arm64.tar.gz"
      sha256 "1a94a3b27a40350589524b800b82cd81e341230c59c5d3b9ef99ed40acefc884"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.2.2/agx-10.2.2-darwin-x64.tar.gz"
      sha256 "30166174fa3e77f1311664d998b8b6bca23f6c309e21a8f79a4d414d1d200ed2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.2.2/agx-10.2.2-linux-arm64.tar.gz"
      sha256 "3c1af2dfa4b014f2f91319d906c7afcb1100c78c85d295a44b7e9b338be1fb70"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.2.2/agx-10.2.2-linux-x64.tar.gz"
      sha256 "2e97ac026046b2e8604c485a475c321d5a2c58ee9c384d77dc483c80d4e65ee4"
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
