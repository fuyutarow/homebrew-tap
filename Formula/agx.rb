class Agx < Formula
  version "10.5.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.5.2/agx-10.5.2-darwin-arm64.tar.gz"
      sha256 "1f56029cd7d0da2df9f94d61a90cd4f0247dcfb94b9e6328a07df91ca0908afc"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.5.2/agx-10.5.2-darwin-x64.tar.gz"
      sha256 "eaa56f62769ead83e5dfc59b9b56b9184bb7df92c461f2ff714a56b4fe322729"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.5.2/agx-10.5.2-linux-arm64.tar.gz"
      sha256 "9a4e4f0b6952b78672943682ac5c967a434990e0e48d17ac095d75308b891334"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.5.2/agx-10.5.2-linux-x64.tar.gz"
      sha256 "454421e0fe111430b925c17b3d1066cadf619a6062dfc20297a23a8380eb472b"
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
