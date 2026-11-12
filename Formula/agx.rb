class Agx < Formula
  version "11.0.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.0.0/agx-11.0.0-darwin-arm64.tar.gz"
      sha256 "5d03079a8194d1af0a57a34375c08abb74db77f222403dfdd5f843f3a922f428"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.0.0/agx-11.0.0-darwin-x64.tar.gz"
      sha256 "0ac6850b4616258cb16f985371ea87301de44b1f151032fa0b07c54ca106cff0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.0.0/agx-11.0.0-linux-arm64.tar.gz"
      sha256 "1a8683dffb4f18853f156e35488999134c4ea0ce4802cfb98010cf6409c6a966"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.0.0/agx-11.0.0-linux-x64.tar.gz"
      sha256 "34da9147b42a571ed593db0008e46aaaddc03e90de6d0c3374cef181c7399671"
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
