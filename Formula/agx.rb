class Agx < Formula
  version "1.18.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.2/agx-1.18.2-darwin-arm64.tar.gz"
      sha256 "10e54b932ce09b3fcceb69fb0db0b88831684bb445b713318bcf462379dbd90b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.2/agx-1.18.2-darwin-x64.tar.gz"
      sha256 "310cdfc6db5bf728e1998b3867b03f8845fb3dce6da59d1e109bf719e59fd7ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.2/agx-1.18.2-linux-arm64.tar.gz"
      sha256 "3731898b611ed80ca64648af334f6449f17f76154046bf0bf93a563e443867ab"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.2/agx-1.18.2-linux-x64.tar.gz"
      sha256 "8d79d225036c19c99a9415e173d5f2600948eb93f9e57129040a674c86f06e74"
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
