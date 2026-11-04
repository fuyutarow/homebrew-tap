class Agx < Formula
  version "1.22.91"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.91/agx-1.22.91-darwin-arm64.tar.gz"
      sha256 "5d69c2744f241a6f1c3640d81f3d0e2c2b14aa6475949dea892bc64dfd5716ee"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.91/agx-1.22.91-darwin-x64.tar.gz"
      sha256 "b6b7cef97277eabe223583352ebe297c290472e2f9f5e4d8a388f203e18632ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.91/agx-1.22.91-linux-arm64.tar.gz"
      sha256 "e16e706a9e67260de1437e1735a24695f66560c3da433afc29920657a0c701bd"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.91/agx-1.22.91-linux-x64.tar.gz"
      sha256 "842079d2b2e7ded5a50597fa58cf84f8fc3daa3f46138d87cdfe579209923ac4"
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
