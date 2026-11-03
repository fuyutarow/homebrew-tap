class Agx < Formula
  version "1.22.69"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.69/agx-1.22.69-darwin-arm64.tar.gz"
      sha256 "ca5ea98cb6be29480ad49dc27d7d139f1422fdcc1b0611f8f564dfc340a9b286"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.69/agx-1.22.69-darwin-x64.tar.gz"
      sha256 "e7b657a4474337d3758cdaea65e222d97a844a9083e17310117b590c743589d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.69/agx-1.22.69-linux-arm64.tar.gz"
      sha256 "71ea4c8ec95811ecaecc37d1eaf32f2179d2682fb23519ff25a922b6a1b7cdd7"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.69/agx-1.22.69-linux-x64.tar.gz"
      sha256 "63102bcc29f8c44bfd3f5aefaf93713daad25642ad73e6c14e83d88f84a2a9bf"
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
