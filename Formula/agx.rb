class Agx < Formula
  version "10.4.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.4.1/agx-10.4.1-darwin-arm64.tar.gz"
      sha256 "b96be5ca9d41df926c8acae16497b627d0861ebaaae1cd1dc91cf953deba6466"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.4.1/agx-10.4.1-darwin-x64.tar.gz"
      sha256 "dcc9a21d85bf0c4903ed89bac38bdf8697b5ceab6b61260ad43167e5fe3aff52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.4.1/agx-10.4.1-linux-arm64.tar.gz"
      sha256 "964de41236574136a009772b9641aa5a55b47e8e188afec8ab21bcc4bb973eea"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.4.1/agx-10.4.1-linux-x64.tar.gz"
      sha256 "23e1ed9698fbca49fff04a1ac55dcda82241d5dc2d655a21e751e24b274d6cc8"
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
