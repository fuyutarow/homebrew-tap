class Agx < Formula
  version "1.22.54"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.54/agx-1.22.54-darwin-arm64.tar.gz"
      sha256 "434b6859ccc5155ad4a43956392d8dbf7a1ef92374c887fdce278a5b2e066611"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.54/agx-1.22.54-darwin-x64.tar.gz"
      sha256 "04ee1a709fc0230fd8f9bfeb5a1aca3df7b8ff099842d7c31a24041d8ecd899e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.54/agx-1.22.54-linux-arm64.tar.gz"
      sha256 "2294411225470618da54c6993a716a71d4ce1056ba40313b47c97469f0dc840d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.54/agx-1.22.54-linux-x64.tar.gz"
      sha256 "964f34cf81ff85ffad1c444eee5ca5525139d0a5db8b53a58d1f1e958c4c8c47"
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
