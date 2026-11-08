class Agx < Formula
  version "5.4.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.4.0/agx-5.4.0-darwin-arm64.tar.gz"
      sha256 "c126400556d45731abd23e4ef90f84017e0b04849db583330624d8062bcd8ddf"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.4.0/agx-5.4.0-darwin-x64.tar.gz"
      sha256 "a493999763e772ccacbdc56559d4c3f32ad0dda10b8c8a66f10d1ee53d990d8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.4.0/agx-5.4.0-linux-arm64.tar.gz"
      sha256 "574e102569448d731e271c5626d7066055536efffcf197acecbb585f125887f4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.4.0/agx-5.4.0-linux-x64.tar.gz"
      sha256 "d3843f449a5ae1cb26ab4c85d75083291c276b5d9bd9a6df45855066174d11ef"
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
