class Agx < Formula
  version "1.22.6"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.6/agx-1.22.6-darwin-arm64.tar.gz"
      sha256 "eec463a166396ec5bdd42be9ec860b5907c4d68291e5fa8f65690873fac9c743"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.6/agx-1.22.6-darwin-x64.tar.gz"
      sha256 "278e37d43965cfb01a8b75fbb728300c4425051f7cc62eebf214683bf6c0f3e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.6/agx-1.22.6-linux-arm64.tar.gz"
      sha256 "027df69c49a9b904b4727055733edd7381713343539f03013c4cd0f9edcf7082"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.6/agx-1.22.6-linux-x64.tar.gz"
      sha256 "b2e97d7bbf7ad6d4bede27b33bc282b6a5ae002d862de8a6c809453f0427cc3b"
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
