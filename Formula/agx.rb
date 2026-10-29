class Agx < Formula
  version "1.22.18"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.18/agx-1.22.18-darwin-arm64.tar.gz"
      sha256 "b5f2068c38578c51e7d7b9c525c42fc936284439de1214ff16db552a76dff2dd"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.18/agx-1.22.18-darwin-x64.tar.gz"
      sha256 "381220ee178e4367fdf6926612de37941e49522554b680d34c0db357075f8b0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.18/agx-1.22.18-linux-arm64.tar.gz"
      sha256 "c9d1c9969072188241c116e2cf911ae150c8d157f2f8b6e426f975d0bbf63b0e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.18/agx-1.22.18-linux-x64.tar.gz"
      sha256 "31027b179d747bc9dec56b54caa1a1da5a7da01aac35829255f0953862cc19cc"
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
