class Agx < Formula
  version "1.22.86"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.86/agx-1.22.86-darwin-arm64.tar.gz"
      sha256 "e5388d0f56f27c4a34feed2a01ff79d23a3bb078f22054d4fe7c5b227efab0d4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.86/agx-1.22.86-darwin-x64.tar.gz"
      sha256 "980e95b23858c197279b7167005eec89bdd40347eac3c2296be64a186d114b0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.86/agx-1.22.86-linux-arm64.tar.gz"
      sha256 "856bada3e644a72235a674a1fc845178174a35f34399cb036dc4dfcaef1ee04e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.86/agx-1.22.86-linux-x64.tar.gz"
      sha256 "02d366570bc2b3872fa679b284adc8fbda80905683fe7e1bb93c6776fdadbfd5"
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
