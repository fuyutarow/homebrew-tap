class Agx < Formula
  version "1.22.13"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.13/agx-1.22.13-darwin-arm64.tar.gz"
      sha256 "007fa2383adddca07b27635179c195217213a60dcf6a1e38e1c0411a98d002e1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.13/agx-1.22.13-darwin-x64.tar.gz"
      sha256 "5357dd3d9c75031c906f4f9df3845ff241e88b66bc211253a08822fe3d8193d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.13/agx-1.22.13-linux-arm64.tar.gz"
      sha256 "a4269b3e89b38f928a014e5d5c40fbfa41530937b8b4f2b41fdd6bb63bfacbad"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.13/agx-1.22.13-linux-x64.tar.gz"
      sha256 "faca80aae777445589f2db3627fe68846a98cf117957c04ecb5dc934367e41ff"
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
