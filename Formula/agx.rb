class Agx < Formula
  version "1.22.92"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.92/agx-1.22.92-darwin-arm64.tar.gz"
      sha256 "d23199962ea3df69b53688e4634d9fca8db7e296d3218c846c8ad380f5771553"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.92/agx-1.22.92-darwin-x64.tar.gz"
      sha256 "c9197cc324d69f5a09345c6815fe9e496762dfbf50bd5ef2588fcac142a3373b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.92/agx-1.22.92-linux-arm64.tar.gz"
      sha256 "f20293104769abbfc2915c994ba3daa90663d3e3a4779c18978fd7e7dd93cfd9"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.92/agx-1.22.92-linux-x64.tar.gz"
      sha256 "a7aa2199db21e00d09f7ab5bc262ae333e81fff2c39683fcf8dbf9a066ee8619"
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
