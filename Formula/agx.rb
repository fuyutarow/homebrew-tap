class Agx < Formula
  version "1.12.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.12.0/agx-1.12.0-darwin-arm64.tar.gz"
      sha256 "cc5f104fd47fac9b1f0657af054e97e7927bad755886172fe9e0181a4e109a71"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.12.0/agx-1.12.0-darwin-x64.tar.gz"
      sha256 "2954f01cca74bd3475f20fb44b281cb0dba73798193f1d8371ebc409f806188d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.12.0/agx-1.12.0-linux-arm64.tar.gz"
      sha256 "6f11c4d0e0948e9d63879d69dd0711edf14fe324e9f904ab316efe1eb344d426"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.12.0/agx-1.12.0-linux-x64.tar.gz"
      sha256 "a50771861c71b0af70eb8f3c217a92cda6a26deb644882cc1a78b81089a382f4"
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
