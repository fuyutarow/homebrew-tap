class Agx < Formula
  version "1.22.14"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.14/agx-1.22.14-darwin-arm64.tar.gz"
      sha256 "1b179f4889cbc454fc397cccdf461079e097bc61755d8469ef85dd9a80f464c1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.14/agx-1.22.14-darwin-x64.tar.gz"
      sha256 "d44dcfacdf89d22416aed7246b3a90e09e5127e9d6625f29df97191ffc326738"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.14/agx-1.22.14-linux-arm64.tar.gz"
      sha256 "a5663dde41c7c2257ed1a63493b0eb29f2fa250f9aef2134a6cb02cd33728517"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.14/agx-1.22.14-linux-x64.tar.gz"
      sha256 "1cc1d671b16d9ed40dcd213617d51e1a24f82629d48303524d1a1fbe1e539a0a"
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
